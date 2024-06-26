package templates

import (
	"encoding/yaml"
	"uuid"
	"strings"

	corev1 "k8s.io/api/core/v1"
	batchv1 "k8s.io/api/batch/v1"
	timoniv1 "timoni.sh/core/v1alpha1"
)

#MigrationJob: batchv1.#Job & {
	#config: #Config
	#cmName: string
	let _checksum = uuid.SHA1(uuid.ns.DNS, yaml.Marshal(#config))
	apiVersion: "batch/v1"
	kind:       "Job"
	metadata: timoniv1.#MetaComponent & {
		#Meta:      #config.metadata
		#Component: "\(strings.SliceRunes(_checksum, 0, 30))"
	}
	metadata: annotations: timoniv1.Action.Force
	spec: batchv1.#JobSpec & {
		activeDeadlineSeconds: #config.migration.deadline
		backoffLimit:          0
		template: corev1.#PodTemplateSpec & {
			metadata: annotations: "timoni.sh/checksum": "\(_checksum)"
			spec: {
				containers: [{
					name:            #config.metadata.name
					image:           #config.image.reference
					imagePullPolicy: #config.image.pullPolicy
					securityContext: #config.securityContext
					command: [
						"./flipt",
						"migrate",
					]
					env: [
						{
							name:  "FLIPT_META_STATE_DIRECTORY"
							value: "/hom/flipt/.config/flipt"
						},
					] + #config.env
					volumeMounts: [{
						mountPath: "/etc/flipt/config/default.yml"
						name:      "flipt-config"
						readOnly:  true
						subPath:   "default.yml"
					}]
					resources: #config.resources
				}]
				volumes: [
					{
						name: "flipt-local-state"
						emptyDir: {}
					},
					{
						name: "flipt-config"
						configMap: name: #cmName
					},
				]
				restartPolicy: "Never"
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
