package templates

import (
	infisicalsecretv1alpha1 "secrets.infisical.com/infisicalsecret/v1alpha1"
)

#InfisicalSecret: infisicalsecretv1alpha1.#InfisicalSecret & {
	#config: #Config
	metadata: {
		namespace: *#config.metadata.namespace | string
	}
	spec: infisicalsecretv1alpha1.#InfisicalSecretSpec & {
		hostAPI: *"https://app.infisical.com/api" | string
	}
}
