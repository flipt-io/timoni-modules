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
		type: corev1.#ServiceTypeClusterIP
		if #config.service.clusterIP != _|_ {
			clusterIP: #config.service.clusterIP
		}
		if #config.service.clusterIPs != _|_ {
			clusterIPs: #config.service.clusterIPs
		}
		if #config.service.loadBalancerIP != _|_ {
			loadBalancerIP: #config.service.loadBalancerIP
		}
		if #config.service.loadBalancerSourceRanges != _|_ {
			loadBalancerSourceRanges: #config.service.loadBalancerSourceRanges
		}
		selector: #config.selector.labels
		ports: [
			{
				port:       #config.service.ports.http
				protocol:   "TCP"
				name:       "http"
				targetPort: name
			},
			{
				port:       #config.service.ports.grpc
				protocol:   "TCP"
				name:       "grpc"
				targetPort: name
			},
		]
	}
}
