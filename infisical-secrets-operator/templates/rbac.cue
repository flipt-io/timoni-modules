package templates

#RBAC: {
	#config: #Config

	"infisical-operator-leader-election-role-role": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "Role"
		metadata: {
			labels: {
				"app.kubernetes.io/component":  "rbac"
				"app.kubernetes.io/created-by": "k8-operator"
				"app.kubernetes.io/instance":   "leader-election-role"
				"app.kubernetes.io/managed-by": "kustomize"
				"app.kubernetes.io/name":       "role"
				"app.kubernetes.io/part-of":    "k8-operator"
			}
			name:      "infisical-operator-leader-election-role"
			namespace: #config.metadata.namespace
		}
		rules: [{
			apiGroups: [""]
			resources: ["configmaps"]
			verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
		}, {
			apiGroups: ["coordination.k8s.io"]
			resources: ["leases"]
			verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
		}, {
			apiGroups: [""]
			resources: ["events"]
			verbs: ["create", "patch"]
		}]
	}
	"infisical-operator-manager-role-clusterrole": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: {
			creationTimestamp: null
			name:              "infisical-operator-manager-role"
		}
		rules: [{
			apiGroups: [""]
			resources: ["configmaps"]
			verbs: ["create", "delete", "get", "list", "update", "watch"]
		}, {
			apiGroups: [""]
			resources: ["secrets"]
			verbs: ["create", "delete", "get", "list", "update", "watch"]
		}, {
			apiGroups: ["apps"]
			resources: ["deployments"]
			verbs: ["get", "list", "update", "watch"]
		}, {
			apiGroups: ["secrets.infisical.com"]
			resources: ["infisicalsecrets"]
			verbs: ["create", "delete", "get", "list", "patch", "update", "watch"]
		}, {
			apiGroups: ["secrets.infisical.com"]
			resources: ["infisicalsecrets/finalizers"]
			verbs: ["update"]
		}, {
			apiGroups: ["secrets.infisical.com"]
			resources: ["infisicalsecrets/status"]
			verbs: ["get", "patch", "update"]
		}]
	}
	"infisical-operator-metrics-reader-clusterrole": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: {
			labels: {
				"app.kubernetes.io/component":  "kube-rbac-proxy"
				"app.kubernetes.io/created-by": "k8-operator"
				"app.kubernetes.io/instance":   "metrics-reader"
				"app.kubernetes.io/managed-by": "kustomize"
				"app.kubernetes.io/name":       "clusterrole"
				"app.kubernetes.io/part-of":    "k8-operator"
			}
			name: "infisical-operator-metrics-reader"
		}
		rules: [{
			nonResourceURLs: ["/metrics"]
			verbs: ["get"]
		}]
	}
	"infisical-operator-proxy-role-clusterrole": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRole"
		metadata: {
			labels: {
				"app.kubernetes.io/component":  "kube-rbac-proxy"
				"app.kubernetes.io/created-by": "k8-operator"
				"app.kubernetes.io/instance":   "proxy-role"
				"app.kubernetes.io/managed-by": "kustomize"
				"app.kubernetes.io/name":       "clusterrole"
				"app.kubernetes.io/part-of":    "k8-operator"
			}
			name: "infisical-operator-proxy-role"
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
	"infisical-operator-leader-election-rolebinding-rolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "RoleBinding"
		metadata: {
			labels: {
				"app.kubernetes.io/component":  "rbac"
				"app.kubernetes.io/created-by": "k8-operator"
				"app.kubernetes.io/instance":   "leader-election-rolebinding"
				"app.kubernetes.io/managed-by": "kustomize"
				"app.kubernetes.io/name":       "rolebinding"
				"app.kubernetes.io/part-of":    "k8-operator"
			}
			name:      "infisical-operator-leader-election-rolebinding"
			namespace: #config.metadata.namespace
		}
		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "Role"
			name:     "infisical-operator-leader-election-role"
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
	"infisical-operator-manager-rolebinding-clusterrolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
		metadata: {
			labels: {
				"app.kubernetes.io/component":  "rbac"
				"app.kubernetes.io/created-by": "k8-operator"
				"app.kubernetes.io/instance":   "manager-rolebinding"
				"app.kubernetes.io/managed-by": "kustomize"
				"app.kubernetes.io/name":       "clusterrolebinding"
				"app.kubernetes.io/part-of":    "k8-operator"
			}
			name: "infisical-operator-manager-rolebinding"
		}
		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "ClusterRole"
			name:     "infisical-operator-manager-role"
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
	"infisical-operator-proxy-rolebinding-clusterrolebinding": {
		apiVersion: "rbac.authorization.k8s.io/v1"
		kind:       "ClusterRoleBinding"
		metadata: {
			labels: {
				"app.kubernetes.io/component":  "kube-rbac-proxy"
				"app.kubernetes.io/created-by": "k8-operator"
				"app.kubernetes.io/instance":   "proxy-rolebinding"
				"app.kubernetes.io/managed-by": "kustomize"
				"app.kubernetes.io/name":       "clusterrolebinding"
				"app.kubernetes.io/part-of":    "k8-operator"
			}
			name: "infisical-operator-proxy-rolebinding"
		}
		roleRef: {
			apiGroup: "rbac.authorization.k8s.io"
			kind:     "ClusterRole"
			name:     "infisical-operator-proxy-role"
		}
		subjects: [{
			kind:      "ServiceAccount"
			name:      #config.metadata.name
			namespace: #config.metadata.namespace
		}]
	}
}
