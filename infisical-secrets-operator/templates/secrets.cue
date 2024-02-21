package templates

import (
	corev1 "k8s.io/api/core/v1"
	infisicalsecretv1alpha1 "secrets.infisical.com/infisicalsecret/v1alpha1"
)

#Secret: corev1.#Secret & {
	#config:    #Config
	apiVersion: "v1"
	kind:       "Secret"
	metadata: {
		name:      #config.infisical.serviceToken.name
		namespace: #config.metadata.namespace
	}
	stringData: infisicalToken: #config.infisical.serviceToken.token
}

#InfisicalSecret: infisicalsecretv1alpha1.#InfisicalSecret & {
	#config: #Config
	metadata: {
		namespace: *#config.metadata.namespace | string
	}
	spec: infisicalsecretv1alpha1.#InfisicalSecretSpec & {
		hostAPI: *"https://app.infisical.com/api" | string
	}
}
