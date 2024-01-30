package templates

#RBAC: {
	#config: #Config
	"traefik-ingress-controller-clusterrole": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata:   #config.metadata

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
	"traefik-ingress-controller-clusterrolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
		metadata:   #config.metadata

		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "ClusterRole"
			name:     #config.metadata
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
}