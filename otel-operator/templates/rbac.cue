package templates

#Role: {
	#config: #Config

	"opentelemetry-operator-leader-election-role": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "Role"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name:      "\(#config.metadata.name)-leader-election-role"
			namespace: #config.metadata.namespace
		}
		rules: [{
			apiGroups: [""]
			resources: ["configmaps"]
			verbs: [
				"get",
				"list",
				"watch",
				"create",
				"update",
				"patch",
				"delete",
			]
		}, {
			apiGroups: [""]
			resources: ["configmaps/status"]
			verbs: [
				"get",
				"update",
				"patch",
			]
		}, {
			apiGroups: [""]
			resources: ["events"]
			verbs: [
				"create",
				"patch",
			]
		}]
	}
}

#ClusterRole: {
	#config: #Config

	"opentelemetry-operator-manager-role": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name: "\(#config.metadata.name)-manager-role"
		}
		rules: [{
			apiGroups: [""]
			resources: [
				"configmaps",
				"persistentvolumeclaims",
				"persistentvolumes",
				"pods",
				"serviceaccounts",
				"services",
			]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: [""]
			resources: ["events"]
			verbs: [
				"create",
				"patch",
			]
		}, {
			apiGroups: [""]
			resources: ["namespaces"]
			verbs: [
				"list",
				"watch",
			]
		}, {
			apiGroups: ["apps"]
			resources: [
				"daemonsets",
				"deployments",
				"statefulsets",
			]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["apps"]
			resources: ["replicasets"]
			verbs: [
				"get",
				"list",
				"watch",
			]
		}, {
			apiGroups: ["autoscaling"]
			resources: ["horizontalpodautoscalers"]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["config.openshift.io"]
			resources: [
				"infrastructures",
				"infrastructures/status",
			]
			verbs: [
				"get",
				"list",
				"watch",
			]
		}, {
			apiGroups: ["coordination.k8s.io"]
			resources: ["leases"]
			verbs: [
				"create",
				"get",
				"list",
				"update",
			]
		}, {
			apiGroups: ["monitoring.coreos.com"]
			resources: [
				"podmonitors",
				"servicemonitors",
			]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["networking.k8s.io"]
			resources: ["ingresses"]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["instrumentations"]
			verbs: [
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["opampbridges"]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["opampbridges/finalizers"]
			verbs: ["update"]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["opampbridges/status"]
			verbs: [
				"get",
				"patch",
				"update",
			]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["opentelemetrycollectors"]
			verbs: [
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["opentelemetrycollectors/finalizers"]
			verbs: [
				"get",
				"patch",
				"update",
			]
		}, {
			apiGroups: ["opentelemetry.io"]
			resources: ["opentelemetrycollectors/status"]
			verbs: [
				"get",
				"patch",
				"update",
			]
		}, {
			apiGroups: ["policy"]
			resources: ["poddisruptionbudgets"]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}, {
			apiGroups: ["route.openshift.io"]
			resources: [
				"routes",
				"routes/custom-host",
			]
			verbs: [
				"create",
				"delete",
				"get",
				"list",
				"patch",
				"update",
				"watch",
			]
		}]
	}
	"opentelemetry-operator-metrics-reader": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name: "\(#config.metadata.name)-metrics-reader"
		}
		rules: [{
			nonResourceURLs: ["/metrics"]
			verbs: ["get"]
		}]
	}
	"opentelemetry-operator-proxy-role": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name: "\(#config.metadata.name)-proxy-role"
		}
		rules: [{
			apiGroups: ["authentication.k8s.io"]
			resources: ["tokenreviews"]
			verbs: ["create"]
		}, {
			apiGroups: ["authorization.k8s.io"]
			resources: ["subjectaccessreviews"]
			verbs: ["create"]
		}]
	}
}

#RoleBinding: {
	#config: #Config

	"opentelemetry-operator-leader-election-rolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "RoleBinding"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name:      "\(#config.metadata.name)-leader-election-rolebinding"
			namespace: #config.metadata.namespace
		}
		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "Role"
			name:     "\(#config.metadata.name)-leader-election-role"
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
}

#ClusterRoleBinding: {
	#config: #Config

	"opentelemetry-operator-manager-rolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name: "\(#config.metadata.name)-manager-rolebinding"
		}
		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "ClusterRole"
			name:     "\(#config.metadata.name)-manager-role"
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
	"opentelemetry-operator-proxy-rolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
		metadata: {
			labels: "app.kubernetes.io/name": #config.metadata.name
			name: "\(#config.metadata.name)-proxy-rolebinding"
		}
		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "ClusterRole"
			name:     "\(#config.metadata.name)-proxy-role"
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
}
