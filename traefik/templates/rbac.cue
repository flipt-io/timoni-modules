package templates

import (
	rbacv1 "k8s.io/api/rbac/v1"
)

#RBAC: {
	#config: #Config
	"traefik-ingress-controller-clusterrole": rbacv1.#ClusterRole & {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: name: #config.metadata.name

		rules: [{
			apiGroups: [""]
			resources: [
				"services",
				"endpoints",
				"secrets",
			]
			verbs: [
				"get",
				"list",
				"watch",
			]
		}, {
			apiGroups: [
				"extensions",
				"networking.k8s.io",
			]
			resources: [
				"ingresses",
				"ingressclasses",
			]
			verbs: [
				"get",
				"list",
				"watch",
			]
		}, {
			apiGroups: [
				"extensions",
				"networking.k8s.io",
			]
			resources: ["ingresses/status"]
			verbs: ["update"]
		}, {
			apiGroups: [
				"traefik.io",
				"traefik.containo.us",
			]
			resources: [
				"middlewares",
				"middlewaretcps",
				"ingressroutes",
				"traefikservices",
				"ingressroutetcps",
				"ingressrouteudps",
				"tlsoptions",
				"tlsstores",
				"serverstransports",
			]
			verbs: [
				"get",
				"list",
				"watch",
			]
		}]
	}
	"traefik-ingress-controller-clusterrolebinding": rbacv1.#ClusterRoleBinding & {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
		metadata: name: #config.metadata.name

		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "ClusterRole"
			name:     #config.metadata.name
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
}
