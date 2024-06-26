// Code generated by timoni.
// Note that this file must have no imports and all values must be concrete.

@if(!debug)

package main

// Defaults
values: {
	manager: image: {
		repository: "infisical/kubernetes-operator"
		digest:     "sha256:94459f1ca9345e70440ce3272ad07432ff83f0d0bef5f77131b11677c27d0127"
		tag:        "v0.5.1"
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
