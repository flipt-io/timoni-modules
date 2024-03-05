package templates

import (
	certificatev1 "cert-manager.io/certificate/v1"
	issuerv1 "cert-manager.io/issuer/v1"
)

#Certificate: certificatev1.#Certificate & {
	#config: #Config
	metadata: {
		labels:    #config.metadata.labels
		namespace: #config.metadata.namespace
		name:      "\(#config.metadata.name)-service-cert"
	}
	spec: certificatev1.#CertificateSpec & {
		dnsNames: [
			"\(#config.metadata.name)-webhook-service.\(#config.metadata.namespace).svc",
			"\(#config.metadata.name)-webhook-service.\(#config.metadata.namespace).svc.cluster.local",
		]
		issuerRef: {
			kind: "Issuer"
			name: "\(#config.metadata.name)-selfsigned-issuer"
		}
		secretName: "\(#config.metadata.name)-controller-manager-service-cert"
		subject: organizationalUnits: [
			#config.metadata.name,
		]
	}
}

#Issuer: issuerv1.#Issuer & {
	#config: #Config
	metadata: {
		name:      "\(#config.metadata.name)-selfsigned-issuer"
		labels:    #config.metadata.labels
		namespace: #config.metadata.namespace
	}
	spec: issuerv1.#IssuerSpec & {
		selfSigned: {}
	}
}
