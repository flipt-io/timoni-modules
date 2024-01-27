package templates

import (
	appsv1 "k8s.io/api/apps/v1"
	corev1 "k8s.io/api/core/v1"
)

#Deployment: appsv1.#Deployment & {
	#config:    #Config
	#cmName:    string
	#sshCMName: string
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata:   #config.metadata
	spec: appsv1.#DeploymentSpec & {
		if #config.autoscaling == _|_ {
			replicas: #config.replicas
		}
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
								containerPort: #config.flipt.server.http_port
								protocol:      "TCP"
							},
							{
								name:          "grpc"
								containerPort: #config.flipt.server.grpc_port
								protocol:      "TCP"
							},
						]
						env: [
							{
								name:  "FLIPT_META_STATE_DIRECTORY"
								value: "/home/flipt/.config/flipt"
							},
							if #config.ssh.knownHosts != _|_ {
								name:  "SSH_KNOWN_HOSTS"
								value: "/etc/flipt/known_hosts"
							},
						] + [
							for k, v in #config.env {name: k, value: v},
						]
						livenessProbe: {
							httpGet: {
								path: "/health"
								port: "http"
							}
							initialDelaySeconds: 3
						}
						readinessProbe: {
							httpGet: {
								path: "/health"
								port: "http"
							}
							initialDelaySeconds: 3
						}
						volumeMounts: [
							{
								mountPath: "/home/flipt/.config/flipt"
								name:      "flipt-local-state"
							},
							{
								mountPath: "/home/flipt/config/default.yml"
								name:      "flipt-config"
								readOnly:  true
								subPath:   "default.yml"
							},
							{
								mountPath: "/var/opt/flipt"
								name:      "flipt-data"
								if #config.persistence.subPath != _|_ {
									subPath: #config.persistent.subPath
								}
							},
							if #config.ssh.knownHosts != _|_ {
								{
									mountPath: "/etc/flipt/ssh_known_hosts"
									name:      "flipt-ssh-known-hosts"
									readOnly:  true
									subPath:   "ssh_known_hosts"
								}
							},
						]
						resources:       #config.resources
						securityContext: #config.securityContext
					},
				]
				volumes: [
					{
						name: "flipt-local-state"
						emptyDir: {}
					},
					{
						name: "flipt-config"
						configMap: name: #cmName
					},
					{
						name: "flipt-data"
						if #config.persistence != _|_ {
							persistentVolumeClaim: claimName: #config.persistence.existingClaim | *#config.metadata.name
						}
						if #config.persistence == _|_ {
							emptyDir: {}
						}
					},
					if #config.ssh.knownHosts != _|_ {
						{
							name: "flipt-ssh-known-hosts"
							configMap: name: #sshCMName
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
