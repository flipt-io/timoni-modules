package templates

import (
	corev1 "k8s.io/api/core/v1"
)

#PersistentVolumeClaim: corev1.#PersistentVolumeClaim & {
	#config:    #Config
	apiVersion: "v1"
	kind:       "PersistentVolumeClaim"
	metadata:   #config.metadata
	spec: corev1.#PersistentVolumeClaimSpec & {
		accessModes: #config.persistence.accessModes
		if #config.persistence.storageClass != _|_ {
			storageClassName: #config.persistence.storageClass
		}
		resources: requests: storage: #config.persistence.size
	}
}
