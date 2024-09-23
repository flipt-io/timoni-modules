// Code generated by timoni.
// Note that this file must have no imports and all values must be concrete.

@if(!debug)

package main

// Defaults
values: {
	manager: image: {
		repository: "infisical/kubernetes-operator"
		digest:     "sha256:139e2b38c0212f94b2901df6b30a172096e0495080cd46bd0663c43f7a789d35"
		tag:        "v0.7.1"
	}
	kubeRBACProxy: image: {
		repository: "gcr.io/kubebuilder/kube-rbac-proxy"
		digest:     ""
		tag:        "v0.15.0"
	}
	test: image: {
		repository: "cgr.dev/chainguard/curl"
		digest:     ""
		tag:        "latest"
	}
}
