package templates

import (
	networkingv1 "k8s.io/api/networking/v1"
)

#Ingress: networkingv1.#Ingress & {
	#config:    #Config
	apiVersion: "networking/v1"
	kind:       "Ingress"
	metadata:   #config.metadata
	spec: networkingv1.#IngressSpec & {
		if #config.ingress.className != _|_ {
			ingressClassName: #config.ingress.className
		}
		if #config.ingress.tls != _|_ {
			tls: #config.ingress.tls
		}
		rules: [for rule in #config.ingress.rules {
			host: rule.host
			http: paths: [for p in rule.paths {
				path:     p.path
				pathType: p.type
				backend: service: {
					name: #config.metadata.name
					port: name: "http"
				}
			}]
		}]
	}
}
