package templates

import (
	"encoding/yaml"

	corev1 "k8s.io/api/core/v1"
	networkingv1 "k8s.io/api/networking/v1"
	timoniv1 "timoni.sh/core/v1alpha1"
	fliptv1 "timoni.sh/flipt/schema/flipt"
)

// Config defines the schema and defaults for the Instance values.
#Config: {
	// The kubeVersion is a required field, set at apply-time
	// via timoni.cue by querying the user's Kubernetes API.
	kubeVersion!: string
	// Using the kubeVersion you can enforce a minimum Kubernetes minor version.
	// By default, the minimum Kubernetes version is set to 1.20.
	clusterVersion: timoniv1.#SemVer & {#Version: kubeVersion, #Minimum: "1.20.0"}

	// The moduleVersion is set from the user-supplied module version.
	// This field is used for the `app.kubernetes.io/version` label.
	moduleVersion!: string

	// The Kubernetes metadata common to all resources.
	// The `metadata.name` and `metadata.namespace` fields are
	// set from the user-supplied instance name and namespace.
	metadata: timoniv1.#Metadata & {#Version: moduleVersion}

	// The labels allows adding `metadata.labels` to all resources.
	// The `app.kubernetes.io/name` and `app.kubernetes.io/version` labels
	// are automatically generated and can't be overwritten.
	metadata: labels: timoniv1.#Labels

	// The annotations allows adding `metadata.annotations` to all resources.
	metadata: annotations?: timoniv1.#Annotations

	// The selector allows adding label selectors to Deployments and Services.
	// The `app.kubernetes.io/name` label selector is automatically generated
	// from the instance name and can't be overwritten.
	selector: timoniv1.#Selector & {#Name: metadata.name}

	// The image allows setting the container image repository,
	// tag, digest and pull policy.
	// The default image repository and tag is set in `values.cue`.
	image!: timoniv1.#Image

	// The resources allows setting the container resource requirements.
	// By default, the container requests 10m CPU and 32Mi memory.
	resources: timoniv1.#ResourceRequirements & {
		requests: {
			cpu:    *"10m" | timoniv1.#CPUQuantity
			memory: *"32Mi" | timoniv1.#MemoryQuantity
		}
	}

	// The number of pods replicas.
	// By default, the number of replicas is 1.
	replicas: *1 | int & >0

	// The securityContext allows setting the container security context.
	// By default, the container is denined privilege escalation.
	securityContext: corev1.#SecurityContext & {
		allowPrivilegeEscalation: *false | true
		privileged:               *false | true
		capabilities: {
			drop: *["ALL"] | [string]
			add: *["CHOWN", "NET_BIND_SERVICE", "SETGID", "SETUID"] | [string]
		}
	}

	// The service allows setting the Kubernetes Service annotations and port.
	// By default, the HTTP port is 8080 and the gRPC port is 9000.
	service: {
		type: corev1.#ServiceType | *corev1.#ServiceTypeClusterIP

		clusterIP?: string
		clusterIPs?: [...string]
		loadBalancerIP?: string
		LoadBalancerSourceRanges?: [...string]

		annotations?: timoniv1.#Annotations

		ports: {
			http: flipt.server.http_port
			grpc: flipt.server.grpc_port
		}
	}

	// Pod optional settings.
	podAnnotations?: {[string]: string}
	podSecurityContext?: corev1.#PodSecurityContext
	imagePullSecrets?: [...timoniv1.#ObjectReference]
	tolerations?: [...corev1.#Toleration]
	affinity?: corev1.#Affinity
	topologySpreadConstraints?: [...corev1.#TopologySpreadConstraint]

	// Test Job disabled by default.
	test: {
		enabled: *false | bool
		image!:  timoniv1.#Image
	}

	flipt: (*({
		log: {
			level:      "INFO"
			encoding:   "console"
			grpc_level: "ERROR"
		}
		server: {
			protocol:   "http"
			host:       "0.0.0.0"
			https_port: 443
			http_port:  8080
			grpc_port:  9000
		}
	} & fliptv1.#FliptSpec) | fliptv1.#FliptSpec)

	persistence?: {
		subPath?:       string
		storageClass?:  string
		existingClaim?: string
		accessModes: *[corev1.#ReadWriteOnce] | [...corev1.#PersistentVolumeAccessMode]
		size: *"5Gi" | string
	}

	env: [...corev1.#EnvVar]

	autoscaling?: {
		minReplicas: *1 | uint
		maxReplicas: *10 | uint & >=minReplicas
		metrics: {
			cpu?: {
				averageUtilization: *80 | int32 & >0 & <=100
			}
			memory?: {
				averageUtilization: int32
			}
		}
	}

	ingress?: {
		#path: {
			path: string
			type: *networkingv1.#PathTypeImplementationSpecific | networkingv1.#PathType
		}
		#rule: {
			host: string
			paths: [...#path]
		}

		className?: string | null
		tls?: [...networkingv1.#IngressTLS]
		rules: *[{
			host: "flipt.local"
			paths: [#path & {path: "/"}]
		}] | [...#rule]
	}

	pdb?: maxUnavailable: *"25%" | string

	ssh: knownHosts?: string

	migration?: deadline: *600 | int // seconds
}

// Instance takes the config values and outputs the Kubernetes objects.
#Instance: {
	config: #Config

	objects: {
		sa: #ServiceAccount & {#config: config}
		svc: #Service & {#config: config}
		cm: #ConfigMap & {
			#config: config
			#Data: "default.yml": yaml.Marshal(config.flipt)
		}
		if config.ssh.knownHosts != _|_ {
			sshCM: #ConfigMap & {
				#config: config
				#Data: ssh_known_hosts: config.ssh.knownHosts
			}
		}

		deploy: #Deployment & {
			#config: config
			#cmName: objects.cm.metadata.name
			if config.ssh.knownHosts != _|_ {
				#sshCMName: objects.sshCM.metadata.name
			}
		}

		if config.autoscaling != _|_ {
			hpa: #HorizontalPodAutoscaler & {#config: config}
		}

		if config.ingress != _|_ {
			ingress: #Ingress & {#config: config}
		}

		if config.pdb != _|_ {
			pdb: #PodDisruptionBudget & {#config: config}
		}

		if config.persistence != _|_ && config.persistence.existingClaim == _|_ {
			pvc: #PersistentVolumeClaim & {#config: config}
		}

		if config.migration != _|_ {
			migration: #MigrationJob & {#config: config}
		}
	}

	tests: {
		"test-svc": #TestJob & {#config: config}
	}
}
