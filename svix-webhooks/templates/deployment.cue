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
				if #config.podAnnotations != _|_ {
					annotations: #config.podAnnotations
				}
			}
			spec: corev1.#PodSpec & {
				serviceAccountName: #config.metadata.name
				containers: [
					{
						name:            #config.metadata.name
						image:           #config.image.reference
						imagePullPolicy: #config.image.pullPolicy
						ports: [
							{
								name:          "http"
								containerPort: #config.service.port
								protocol:      "TCP"
							},
						]
						env: [
							{
								name:  "SVIX_REDIS_DSN"
								value: #config.connections.redisDSN
							},
							{
								name:  "SVIX_DB_DSN"
								value: #config.connections.dbDSN
							},
							{
								name:  "WAIT_FOR"
								value: "true" // Wait for default services.
							},
						] + [
							for k, v in #config.env {name: k, value: v},
						]
						livenessProbe: {
							httpGet: {
								path: "/healthz"
								port: "http"
							}
							initialDelaySeconds: 3
						}
						readinessProbe: {
							httpGet: {
								path: "/healthz"
								port: "http"
							}
							initialDelaySeconds: 3
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
