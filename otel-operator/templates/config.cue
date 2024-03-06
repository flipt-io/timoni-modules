package templates

import (
	corev1 "k8s.io/api/core/v1"
	timoniv1 "timoni.sh/core/v1alpha1"
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
	selector: (timoniv1.#Selector & {
		#Name: metadata.name
	}) & {
		labels: "control-plane": "controller-manager"
	}

	// The image allows setting the container image repository,
	// tag, digest and pull policy.
	// The default image repository and tag is set in `values.cue`.
	image!: timoniv1.#Image

	kubeRBACProxy: image!: timoniv1.#Image

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
		capabilities:
		{
			drop: *["ALL"] | [string]
			add: *["CHOWN", "NET_BIND_SERVICE", "SETGID", "SETUID"] | [string]
		}
	}

	services: [Name=string]: #service & {
		component: Name
	}

	services: {
		"controller-manager-metrics-service": {
			labels: selector.labels

			port: {
				name:       "https"
				port:       *8443 | int & >0 & <=65535
				protocol:   "TCP"
				targetPort: name
			}
		}
		"webhook-service": {
			labels: "app.kubernetes.io/name": metadata.name

			port: {
				port:       *443 | int & >0 & <=65535
				protocol:   "TCP"
				targetPort: 9443
			}
		}
	}

	// Pod optional settings.
	podAnnotations?: {[string]: string}
	podSecurityContext?: corev1.#PodSecurityContext
	imagePullSecrets?: [...timoniv1.ObjectReference]
	tolerations?: [...corev1.#Toleration]
	affinity?: corev1.#Affinity
	topologySpreadConstraints?: [...corev1.#TopologySpreadConstraint]
}

// Instance takes the config values and outputs the Kubernetes objects.
#Instance: {
	config: #Config

	objects: {
		sa: #ServiceAccount & {#config: config}
		deploy: #Deployment & {#config: config}
		issuer: #Issuer & {#config: config}
		certificate: #Certificate & {#config: config}
		mutate: #MutatingWebhookConfiguration & {#config: config}
		validate: #ValidatingWebhookConfiguration & {#config: config}

		for k, v in config.services {
			"svc-\(k)": #Service & {
				#config: config
				#def:    v
			}
		}

		for k, v in #CustomResourceDefinition {
			"\(k)": v & {#config: config}
		}

		for k, v in (#Role & {#config: config}) {
			"\(k)": v
		}

		for k, v in (#ClusterRole & {#config: config}) {
			"\(k)": v
		}

		for k, v in (#RoleBinding & {#config: config}) {
			"\(k)": v
		}

		for k, v in (#ClusterRoleBinding & {#config: config}) {
			"\(k)": v
		}
	}
}
