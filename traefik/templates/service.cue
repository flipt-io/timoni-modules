package templates

import (
	corev1 "k8s.io/api/core/v1"
)

#Service: corev1.#Service & {
	#config:    #Config
	apiVersion: "v1"
	kind:       "Service"
	metadata:   #config.metadata
	if #config.service.annotations != _|_ {
		metadata: annotations: #config.service.annotations
	}
	spec: corev1.#ServiceSpec & {
		type:     #config.service.type
		selector: #config.selector.labels
		ports: [
			for portName, p in #config.service.ports {
				port:       p.port
				protocol:   "TCP"
				name:       portName
				targetPort: portName
				if p.nodePort != _|_ {
					nodePort: p.nodePort
				}
			},
		]
	}
}
