package templates

import (
	admissionregistrationv1 "k8s.io/api/admissionregistration/v1"
)

#clientConfigService: {
	#conf:     #Config
	name:      "\(#conf.metadata.name)-webhook-service"
	namespace: #conf.metadata.namespace
	path:      string
}

#MutatingWebhookConfiguration: admissionregistrationv1.#MutatingWebhookConfiguration & {
	#config: #Config

	apiVersion: "admissionregistration.k8s.io/v1"
	kind:       "MutatingWebhookConfiguration"
	metadata: {
		annotations: "cert-manager.io/inject-ca-from": "\(#config.metadata.namespace)/\(#config.metadata.name)-serving-cert"
		labels: "app.kubernetes.io/name":              #config.metadata.name
		name: "\(#config.metadata.name)-mutating-webhook-configuration"
	}

	webhooks: [{
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/mutate-opentelemetry-io-v1alpha1-instrumentation"
		}
		failurePolicy: "Fail"
		name:          "minstrumentation.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["instrumentations"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/mutate-opentelemetry-io-v1alpha1-opampbridge"
		}
		failurePolicy: "Fail"
		name:          "mopampbridge.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["opampbridges"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/mutate-opentelemetry-io-v1alpha1-opentelemetrycollector"
		}
		failurePolicy: "Fail"
		name:          "mopentelemetrycollector.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["opentelemetrycollectors"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/mutate-v1-pod"
		}
		failurePolicy: "Ignore"
		name:          "mpod.kb.io"
		rules: [{
			apiGroups: [""]
			apiVersions: ["v1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["pods"]
		}]
		sideEffects: "None"
	}]
}

#ValidatingWebhookConfiguration: admissionregistrationv1.#ValidatingWebhookConfiguration & {
	#config: #Config

	apiVersion: "admissionregistration.k8s.io/v1"
	kind:       "ValidatingWebhookConfiguration"
	metadata: {
		annotations: "cert-manager.io/inject-ca-from": "\(#config.metadata.namespace)/\(#config.metadata.name)-serving-cert"
		labels: "app.kubernetes.io/name":              #config.metadata.name
		name: "\(#config.metadata.name)-validating-webhook-configuration"
	}
	webhooks: [{
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/validate-opentelemetry-io-v1alpha1-instrumentation"
		}
		failurePolicy: "Fail"
		name:          "vinstrumentationcreateupdate.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["instrumentations"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/validate-opentelemetry-io-v1alpha1-instrumentation"
		}
		failurePolicy: "Ignore"
		name:          "vinstrumentationdelete.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: ["DELETE"]
			resources: ["instrumentations"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/validate-opentelemetry-io-v1alpha1-opampbridge"
		}
		failurePolicy: "Fail"
		name:          "vopampbridgecreateupdate.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["opampbridges"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/validate-opentelemetry-io-v1alpha1-opampbridge"
		}
		failurePolicy: "Ignore"
		name:          "vopampbridgedelete.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: ["DELETE"]
			resources: ["opampbridges"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/validate-opentelemetry-io-v1alpha1-opentelemetrycollector"
		}
		failurePolicy: "Fail"
		name:          "vopentelemetrycollectorcreateupdate.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: [
				"CREATE",
				"UPDATE",
			]
			resources: ["opentelemetrycollectors"]
		}]
		sideEffects: "None"
	}, {
		admissionReviewVersions: ["v1"]
		clientConfig: service: #clientConfigService & {
			#conf: #config
			path:  "/validate-opentelemetry-io-v1alpha1-opentelemetrycollector"
		}
		failurePolicy: "Ignore"
		name:          "vopentelemetrycollectordelete.kb.io"
		rules: [{
			apiGroups: ["opentelemetry.io"]
			apiVersions: ["v1alpha1"]
			operations: ["DELETE"]
			resources: ["opentelemetrycollectors"]
		}]
		sideEffects: "None"
	}]
}
