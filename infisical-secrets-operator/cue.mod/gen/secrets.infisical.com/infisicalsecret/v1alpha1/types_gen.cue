// Code generated by timoni. DO NOT EDIT.

//timoni:generate timoni vendor crd -f infisical.yml

package v1alpha1

import "strings"

// InfisicalSecret is the Schema for the infisicalsecrets API
#InfisicalSecret: {
	// APIVersion defines the versioned schema of this representation
	// of an object. Servers should convert recognized schemas to the
	// latest internal value, and may reject unrecognized values.
	// More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
	apiVersion: "secrets.infisical.com/v1alpha1"

	// Kind is a string value representing the REST resource this
	// object represents. Servers may infer this from the endpoint
	// the client submits requests to. Cannot be updated. In
	// CamelCase. More info:
	// https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
	kind: "InfisicalSecret"
	metadata!: {
		name!: strings.MaxRunes(253) & strings.MinRunes(1) & {
			string
		}
		namespace!: strings.MaxRunes(63) & strings.MinRunes(1) & {
			string
		}
		labels?: {
			[string]: string
		}
		annotations?: {
			[string]: string
		}
	}

	// InfisicalSecretSpec defines the desired state of
	// InfisicalSecret
	spec!: #InfisicalSecretSpec
}

// InfisicalSecretSpec defines the desired state of
// InfisicalSecret
#InfisicalSecretSpec: {
	authentication?: {
		serviceAccount?: {
			environmentName: string
			projectId:       string
			serviceAccountSecretReference: {
				// The name of the Kubernetes Secret
				secretName: string

				// The name space where the Kubernetes Secret is located
				secretNamespace: string
			}
		}
		serviceToken?: {
			secretsScope: {
				envSlug:     string
				secretsPath: string
			}
			serviceTokenSecretReference: {
				// The name of the Kubernetes Secret
				secretName: string

				// The name space where the Kubernetes Secret is located
				secretNamespace: string
			}
		}
	}

	// Infisical host to pull secrets from
	hostAPI?: string
	managedSecretReference: {
		// The name of the Kubernetes Secret
		secretName: string

		// The name space where the Kubernetes Secret is located
		secretNamespace: string

		// The Kubernetes Secret type (experimental feature). More info:
		// https://kubernetes.io/docs/concepts/configuration/secret/#secret-types
		secretType?: string | *"Opaque"
	}
	resyncInterval: int | *60
	tokenSecretReference?: {
		// The name of the Kubernetes Secret
		secretName: string

		// The name space where the Kubernetes Secret is located
		secretNamespace: string
	}
}