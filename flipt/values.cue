// Code generated by timoni.
// Note that this file must have no imports and all values must be concrete.

@if(!debug)

package main

// Defaults
values: {
	image: {
		repository: "docker.flipt.io/flipt/flipt"
		digest:     "sha256:257ca92331a828be1df8c231cdb181dbe68ab43444d7c1563594981c573fb2cb"
		tag:        "v1.36.0"
	}
	test: image: {
		repository: "busybox"
		digest:     ""
		tag:        "latest"
	}
	persistence: enabled: true
	ssh: knownHosts:      "some-know-host"
	env: KEY:             "VALUE"
	autoscaling: {
		metrics: cpu: averageUtilization: 70
	}
	ingress: _
	pdb:     _
}
