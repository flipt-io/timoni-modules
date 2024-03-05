package templates

import (
	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
)

#Deployment: appsv1.#Deployment & {
	#config:    #Config
	#cmName:    string
	apiVersion: "apps/v1"
	kind:       "Deployment"

	metadata: #config.metadata
	metadata: labels: "control-plane": "controller-manager"

	spec: appsv1.#DeploymentSpec & {
		replicas: #config.replicas
		selector: matchLabels: #config.selector.labels
		template: {
			metadata: {
				labels: #config.selector.labels
				if #config.podAnnotations != _|_ {
					annotations: #config.podAnnotations
				}
			}
			spec: corev1.#PodSpec & {
				serviceAccountName: #config.metadata.name
				containers: [
					{
						name:            "manager"
						image:           #config.image.reference
						imagePullPolicy: #config.image.pullPolicy
						args: [
							"--metrics-addr=127.0.0.1:8080",
							"--enable-leader-election",
							"--zap-log-level=info",
							"--zap-time-encoding=rfc3339nano",
							"--feature-gates=+operator.autoinstrumentation.go,+operator.autoinstrumentation.nginx",
						]
						ports: [
							{
								name:          "webhook-server"
								containerPort: 9443
								protocol:      "TCP"
							},
						]
						livenessProbe: {
							httpGet: {
								path: "/healthz"
								port: 8081
							}
							initialDelaySeconds: 15
							periodSeconds:       20
						}
						readinessProbe: {
							httpGet: {
								path: "/readyz"
								port: 8081
							}
							initialDelaySeconds: 5
							periodSeconds:       10
						}
						resources:       #config.resources
						securityContext: #config.securityContext
						volumeMounts: [
							{
								mountPath: "/tmp/k8s-webhook-server/serving-certs"
								name:      "cert"
								readOnly:  true
							},
						]
					},
					{
						name:            "kube-rbac-proxy"
						image:           #config.kubeRBACProxy.image.reference
						imagePullPolicy: #config.image.pullPolicy
						args: [
							"--secure-listen-address=0.0.0.0:8443",
							"--upstream=http://127.0.0.1:8080/",
							"--logtostderr=true",
							"--v=0",
						]
						ports: [
							{
								name:          "https"
								containerPort: 8443
								protocol:      "TCP"
							},
						]
						resources:       #config.resources
						securityContext: #config.securityContext
					},
				]
				terminationGracePeriodSeconds: 10
				volumes: [
					{
						name: "cert"
						secret: {
							defaultMode: 420
							secretName:  "\(#config.metadata.name)-controller-manager-service-cert"
						}
					},
				]
				if #config.podSecurityContext != _|_ {
					securityContext: #config.podSecurityContext
				}
				if #config.topologySpreadConstraints != _|_ {
					topologySpreadConstraints: #config.topologySpreadConstraints
				}
				if #config.affinity != _|_ {
					affinity: #config.affinity
				}
				if #config.tolerations != _|_ {
					tolerations: #config.tolerations
				}
				if #config.imagePullSecrets != _|_ {
					imagePullSecrets: #config.imagePullSecrets
				}
			}
		}
	}
}
