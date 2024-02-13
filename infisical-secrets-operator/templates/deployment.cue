package templates

import (
	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
)

#Deployment: appsv1.#Deployment & {
	#config:    #Config
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #config.metadata
	spec: appsv1.#DeploymentSpec & {
		replicas: #config.replicas
		selector: matchLabels: #config.selector.labels
		template: {
			metadata: {
				labels: #config.selector.labels
				annotations: "kubectl.kubernetes.io/default-container": #config.metadata.name
				if #config.podAnnotations != _|_ {
					annotations: #config.podAnnotations
				}
			}
			spec: corev1.#PodSpec & {
				serviceAccountName: #config.metadata.name
				containers: [
					{
						name:            "kube-rbac-proxy"
						image:           #config.kubeRBACProxy.image.reference
						imagePullPolicy: #config.kubeRBACProxy.image.pullPolicy
						args: [
							"--secure-listen-address=0.0.0.0:\(#config.service.port)",
							"--upstream=http://127.0.0.1:8080/",
							"--logtostderr=true",
							"--v=0",
						]
						ports: [
							{
								containerPort: #config.service.port
								name:          "https"
								protocol:      "TCP"
							},
						]
						resources:       #config.resources
						securityContext: #config.securityContext
					},
					{
						name:            #config.metadata.name
						image:           #config.manager.image.reference
						imagePullPolicy: #config.manager.image.pullPolicy
						args: [
							"--health-probe-bind-address=:8081",
							"--metrics-bind-address=127.0.0.1:8080",
							"--leader-elect",
						]
						livenessProbe: {
							httpGet: {
								path: "/healthz"
								port: 8081
							}
						}
						readinessProbe: {
							httpGet: {
								path: "/readyz"
								port: 8081
							}
						}
						resources:       #config.resources
						securityContext: #config.securityContext
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
