package templates

import (
	autoscalingv2 "k8s.io/api/autoscaling/v2"
)

#HorizontalPodAutoscaler: autoscalingv2.#HorizontalPodAutoscaler & {
	#config:    #Config
	apiVersion: "autoscaling/v2"
	kind:       "HorizontalPodAutoscaler"
	metadata:   #config.metadata
	spec: autoscalingv2.#HorizontalPodAutoscalerSpec & {
		scaleTargetRef: autoscalingv2.#CrossVersionObjectReference & {
			apiVersion: "apps/v1"
			kind:       "Deployment"
			name:       #config.metadata.name
		}
		minReplicas: #config.autoscaling.minReplicas
		maxReplicas: #config.autoscaling.maxReplicas
		metrics: [
			if #config.autoscaling.metrics.cpu != _|_ {
				#cpu: #config.autoscaling.metrics.cpu
				{
					type: autoscalingv2.#ResourceMetricSourceType
					resource: {
						name: "cpu"
						target: {
							type:               autoscalingv2.#UtilizationMetricType
							averageUtilization: #cpu.averageUtilization
						}
					}
				}
			},
			if #config.autoscaling.metrics.memory != _|_ {
				#memory: #config.autoscaling.metrics.memory
				{
					type: autoscalingv2.#ResourceMetricSourceType
					resource: {
						name: "memory"
						target: {
							type:               autoscalingv2.#UtilizationMetricType
							averageUtilization: #memory.averageUtilization
						}
					}
				}
			},
		]
	}
}
