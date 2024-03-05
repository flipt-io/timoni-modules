package templates

import (
	corev1 "k8s.io/api/core/v1"
)

#service: {
	component: string

	labels?: [string]: string

	port: {
		name?:      string
		port:       int & >0 & <=65535
		protocol:   "TCP"
		targetPort: string | (int & >0 & <=65535)
	}
}

#Service: corev1.#Service & {
	#config:    #Config
	#def:       #service
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      "\(#config.metadata.name)-\(#def.component)"
		namespace: #config.metadata.namespace
		labels:    #def.labels
	}
	spec: corev1.#ServiceSpec & {
		type:     corev1.#ServiceTypeClusterIP
		selector: #config.selector.labels
		ports: [
			#def.port,
		]
	}
}
