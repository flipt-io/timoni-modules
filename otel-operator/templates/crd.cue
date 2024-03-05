package templates

#CustomResourceDefinition: instrumentations: {
	#config:    #Config
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: "controller-gen.kubebuilder.io/version": "v0.12.0"
		labels: "app.kubernetes.io/name":                     #config.metadata.name
		name: "instrumentations.opentelemetry.io"
	}
	spec: {
		group: "opentelemetry.io"
		names: {
			kind:     "Instrumentation"
			listKind: "InstrumentationList"
			plural:   "instrumentations"
			shortNames: [
				"otelinst",
				"otelinsts",
			]
			singular: "instrumentation"
		}
		scope: "Namespaced"
		versions: [{
			additionalPrinterColumns: [{
				jsonPath: ".metadata.creationTimestamp"
				name:     "Age"
				type:     "date"
			}, {
				jsonPath: ".spec.exporter.endpoint"
				name:     "Endpoint"
				type:     "string"
			}, {
				jsonPath: ".spec.sampler.type"
				name:     "Sampler"
				type:     "string"
			}, {
				jsonPath: ".spec.sampler.argument"
				name:     "Sampler Arg"
				type:     "string"
			}]
			name: "v1alpha1"
			schema: openAPIV3Schema: {
				description: "Instrumentation is the spec for OpenTelemetry instrumentation."
				properties: {
					apiVersion: {
						description: "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values."
						type:        "string"
					}
					kind: {
						description: "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase."
						type:        "string"
					}
					metadata: type: "object"
					spec: {
						description: "InstrumentationSpec defines the desired state of OpenTelemetry SDK and instrumentation."
						properties: {
							apacheHttpd: {
								description: "ApacheHttpd defines configuration for Apache HTTPD auto-instrumentation."
								properties: {
									attrs: {
										description: "Attrs defines Apache HTTPD agent specific attributes. The precedence is: `agent default attributes` > `instrument spec attributes` . Attributes are documented at https://github."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									configPath: {
										description: "Location of Apache HTTPD server configuration. Needed only if different from default \"/usr/local/apache2/conf\""
										type:        "string"
									}
									env: {
										description: "Env defines Apache HTTPD specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with Apache SDK and auto-instrumentation."
										type:        "string"
									}
									resourceRequirements: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									version: {
										description: "Apache HTTPD server version. One of 2.4 or 2.2. Default is 2.4"
										type:        "string"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							dotnet: {
								description: "DotNet defines configuration for DotNet auto-instrumentation."
								properties: {
									env: {
										description: "Env defines DotNet specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with DotNet SDK and auto-instrumentation."
										type:        "string"
									}
									resourceRequirements: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							env: {
								description: "Env defines common env vars."
								items: {
									description: "EnvVar represents an environment variable present in a Container."
									properties: {
										name: {
											description: "Name of the environment variable. Must be a C_IDENTIFIER."
											type:        "string"
										}
										value: {
											description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
											type:        "string"
										}
										valueFrom: {
											description: "Source for the environment variable's value. Cannot be used if value is not empty."
											properties: {
												configMapKeyRef: {
													description: "Selects a key of a ConfigMap."
													properties: {
														key: {
															description: "The key to select."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
															type:        "string"
														}
														optional: {
															description: "Specify whether the ConfigMap or its key must be defined"
															type:        "boolean"
														}
													}
													required: ["key"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												fieldRef: {
													description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
													properties: {
														apiVersion: {
															description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
															type:        "string"
														}
														fieldPath: {
															description: "Path of the field to select in the specified API version."
															type:        "string"
														}
													}
													required: ["fieldPath"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												resourceFieldRef: {
													description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
													properties: {
														containerName: {
															description: "Container name: required for volumes, optional for env vars"
															type:        "string"
														}
														divisor: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
															pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
															"x-kubernetes-int-or-string": true
														}
														resource: {
															description: "Required: resource to select"
															type:        "string"
														}
													}
													required: ["resource"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												secretKeyRef: {
													description: "Selects a key of a secret in the pod's namespace"
													properties: {
														key: {
															description: "The key of the secret to select from.  Must be a valid secret key."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
															type:        "string"
														}
														optional: {
															description: "Specify whether the Secret or its key must be defined"
															type:        "boolean"
														}
													}
													required: ["key"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											type: "object"
										}
									}
									required: ["name"]
									type: "object"
								}
								type: "array"
							}
							exporter: {
								description: "Exporter defines exporter configuration."
								properties: endpoint: {
									description: "Endpoint is address of the collector with OTLP endpoint."
									type:        "string"
								}
								type: "object"
							}
							go: {
								description: "Go defines configuration for Go auto-instrumentation."
								properties: {
									env: {
										description: "Env defines Go specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with Go SDK and auto-instrumentation."
										type:        "string"
									}
									resourceRequirements: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							java: {
								description: "Java defines configuration for java auto-instrumentation."
								properties: {
									env: {
										description: "Env defines java specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with javaagent auto-instrumentation JAR."
										type:        "string"
									}
									resources: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							nginx: {
								description: "Nginx defines configuration for Nginx auto-instrumentation."
								properties: {
									attrs: {
										description: "Attrs defines Nginx agent specific attributes. The precedence order is: `agent default attributes` > `instrument spec attributes` . Attributes are documented at https://github."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									configFile: {
										description: "Location of Nginx configuration file. Needed only if different from default \"/etx/nginx/nginx.conf\""
										type:        "string"
									}
									env: {
										description: "Env defines Nginx specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with Nginx SDK and auto-instrumentation."
										type:        "string"
									}
									resourceRequirements: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							nodejs: {
								description: "NodeJS defines configuration for nodejs auto-instrumentation."
								properties: {
									env: {
										description: "Env defines nodejs specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with NodeJS SDK and auto-instrumentation."
										type:        "string"
									}
									resourceRequirements: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							propagators: {
								description: "Propagators defines inter-process context propagation configuration. Values in this list will be set in the OTEL_PROPAGATORS env var. Enum=tracecontext;baggage;b3;b3multi;jaeger;xray;ottrace;none"
								items: {
									description: "Propagator represents the propagation type."
									enum: [
										"tracecontext",
										"baggage",
										"b3",
										"b3multi",
										"jaeger",
										"xray",
										"ottrace",
										"none",
									]
									type: "string"
								}
								type: "array"
							}
							python: {
								description: "Python defines configuration for python auto-instrumentation."
								properties: {
									env: {
										description: "Env defines python specific env vars."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									image: {
										description: "Image is a container image with Python SDK and auto-instrumentation."
										type:        "string"
									}
									resourceRequirements: {
										description: "Resources describes the compute resource requirements."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									volumeLimitSize: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "VolumeSizeLimit defines size limit for volume used for auto-instrumentation. The default size is 200Mi."
										pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							resource: {
								description: "Resource defines the configuration for the resource attributes, as defined by the OpenTelemetry specification."
								properties: {
									addK8sUIDAttributes: {
										description: "AddK8sUIDAttributes defines whether K8s UID attributes should be collected (e.g. k8s.deployment.uid)."
										type:        "boolean"
									}
									resourceAttributes: {
										additionalProperties: type: "string"
										description: "Attributes defines attributes that are added to the resource. For example environment: dev"
										type:        "object"
									}
								}
								type: "object"
							}
							sampler: {
								description: "Sampler defines sampling configuration."
								properties: {
									argument: {
										description: "Argument defines sampler argument. The value depends on the sampler type. For instance for parentbased_traceidratio sampler type it is a number in range [0..1] e.g. 0.25."
										type:        "string"
									}
									type: {
										description: "Type defines sampler type. The value will be set in the OTEL_TRACES_SAMPLER env var. The value can be for instance parentbased_always_on, parentbased_always_off, parentbased_traceidratio..."
										enum: [
											"always_on",
											"always_off",
											"traceidratio",
											"parentbased_always_on",
											"parentbased_always_off",
											"parentbased_traceidratio",
											"jaeger_remote",
											"xray",
										]
										type: "string"
									}
								}
								type: "object"
							}
						}
						type: "object"
					}
					status: {
						description: "InstrumentationStatus defines status of the instrumentation."
						type:        "object"
					}
				}
				type: "object"
			}
			served:  true
			storage: true
			subresources: status: {}
		}]
	}
}
#CustomResourceDefinition: opampbridges: {
	#config:    #Config
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: {
			"cert-manager.io/inject-ca-from":        "#\(#config.metadata.namespace)/\(#config.metadata.name)-serving-cert"
			"controller-gen.kubebuilder.io/version": "v0.12.0"
		}
		labels: "app.kubernetes.io/name": #config.metadata.name
		name: "opampbridges.opentelemetry.io"
	}
	spec: {
		group: "opentelemetry.io"
		names: {
			kind:     "OpAMPBridge"
			listKind: "OpAMPBridgeList"
			plural:   "opampbridges"
			singular: "opampbridge"
		}
		scope: "Namespaced"
		versions: [{
			additionalPrinterColumns: [{
				jsonPath: ".metadata.creationTimestamp"
				name:     "Age"
				type:     "date"
			}, {
				description: "OpenTelemetry Version"
				jsonPath:    ".status.version"
				name:        "Version"
				type:        "string"
			}, {
				jsonPath: ".spec.endpoint"
				name:     "Endpoint"
				type:     "string"
			}]
			name: "v1alpha1"
			schema: openAPIV3Schema: {
				description: "OpAMPBridge is the Schema for the opampbridges API."
				properties: {
					apiVersion: {
						description: "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values."
						type:        "string"
					}
					kind: {
						description: "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase."
						type:        "string"
					}
					metadata: type: "object"
					spec: {
						description: "OpAMPBridgeSpec defines the desired state of OpAMPBridge."
						properties: {
							affinity: {
								description: "If specified, indicates the pod's scheduling constraints"
								properties: {
									nodeAffinity: {
										description: "Describes node affinity scheduling rules for the pod."
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												description: "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
												items: {
													description: "An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op)."
													properties: {
														preference: {
															description: "A node selector term, associated with the corresponding weight."
															properties: {
																matchExpressions: {
																	description: "A list of node selector requirements by node's labels."
																	items: {
																		description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "The label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																				type:        "string"
																			}
																			values: {
																				description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchFields: {
																	description: "A list of node selector requirements by node's fields."
																	items: {
																		description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "The label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																				type:        "string"
																			}
																			values: {
																				description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														weight: {
															description: "Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100."
															format:      "int32"
															type:        "integer"
														}
													}
													required: [
														"preference",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												description: "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
												properties: nodeSelectorTerms: {
													description: "Required. A list of node selector terms. The terms are ORed."
													items: {
														description: "A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm."
														properties: {
															matchExpressions: {
																description: "A list of node selector requirements by node's labels."
																items: {
																	description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																	properties: {
																		key: {
																			description: "The label key that the selector applies to."
																			type:        "string"
																		}
																		operator: {
																			description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																			type:        "string"
																		}
																		values: {
																			description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
															matchFields: {
																description: "A list of node selector requirements by node's fields."
																items: {
																	description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																	properties: {
																		key: {
																			description: "The label key that the selector applies to."
																			type:        "string"
																		}
																		operator: {
																			description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																			type:        "string"
																		}
																		values: {
																			description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													type: "array"
												}
												required: ["nodeSelectorTerms"]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
										}
										type: "object"
									}
									podAffinity: {
										description: "Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s))."
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												description: "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
												items: {
													description: "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
													properties: {
														podAffinityTerm: {
															description: "Required. A pod affinity term, associated with the corresponding weight."
															properties: {
																labelSelector: {
																	description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																matchLabelKeys: {
																	description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																mismatchLabelKeys: {
																	description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																namespaceSelector: {
																	description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																	items: type: "string"
																	type: "array"
																}
																topologyKey: {
																	description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																	type:        "string"
																}
															}
															required: ["topologyKey"]
															type: "object"
														}
														weight: {
															description: "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
															format:      "int32"
															type:        "integer"
														}
													}
													required: [
														"podAffinityTerm",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												description: "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
												items: {
													description: "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-locate"
													properties: {
														labelSelector: {
															description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														matchLabelKeys: {
															description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														mismatchLabelKeys: {
															description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														namespaceSelector: {
															description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaces: {
															description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
															items: type: "string"
															type: "array"
														}
														topologyKey: {
															description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
															type:        "string"
														}
													}
													required: ["topologyKey"]
													type: "object"
												}
												type: "array"
											}
										}
										type: "object"
									}
									podAntiAffinity: {
										description: "Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s))."
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												description: "The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
												items: {
													description: "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
													properties: {
														podAffinityTerm: {
															description: "Required. A pod affinity term, associated with the corresponding weight."
															properties: {
																labelSelector: {
																	description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																matchLabelKeys: {
																	description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																mismatchLabelKeys: {
																	description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																namespaceSelector: {
																	description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																	items: type: "string"
																	type: "array"
																}
																topologyKey: {
																	description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																	type:        "string"
																}
															}
															required: ["topologyKey"]
															type: "object"
														}
														weight: {
															description: "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
															format:      "int32"
															type:        "integer"
														}
													}
													required: [
														"podAffinityTerm",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												description: "If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
												items: {
													description: "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-locate"
													properties: {
														labelSelector: {
															description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														matchLabelKeys: {
															description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														mismatchLabelKeys: {
															description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														namespaceSelector: {
															description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaces: {
															description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
															items: type: "string"
															type: "array"
														}
														topologyKey: {
															description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
															type:        "string"
														}
													}
													required: ["topologyKey"]
													type: "object"
												}
												type: "array"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							capabilities: {
								additionalProperties: type: "boolean"
								description: "Capabilities supported by the OpAMP Bridge"
								type:        "object"
							}
							componentsAllowed: {
								additionalProperties: {
									items: type: "string"
									type: "array"
								}
								description: "ComponentsAllowed is a list of allowed OpenTelemetry components for each pipeline type (receiver, processor, etc.)"
								type:        "object"
							}
							endpoint: {
								description: "OpAMP backend Server endpoint"
								type:        "string"
							}
							env: {
								description: "ENV vars to set on the OpAMPBridge Pods."
								items: {
									description: "EnvVar represents an environment variable present in a Container."
									properties: {
										name: {
											description: "Name of the environment variable. Must be a C_IDENTIFIER."
											type:        "string"
										}
										value: {
											description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
											type:        "string"
										}
										valueFrom: {
											description: "Source for the environment variable's value. Cannot be used if value is not empty."
											properties: {
												configMapKeyRef: {
													description: "Selects a key of a ConfigMap."
													properties: {
														key: {
															description: "The key to select."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
															type:        "string"
														}
														optional: {
															description: "Specify whether the ConfigMap or its key must be defined"
															type:        "boolean"
														}
													}
													required: ["key"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												fieldRef: {
													description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
													properties: {
														apiVersion: {
															description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
															type:        "string"
														}
														fieldPath: {
															description: "Path of the field to select in the specified API version."
															type:        "string"
														}
													}
													required: ["fieldPath"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												resourceFieldRef: {
													description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
													properties: {
														containerName: {
															description: "Container name: required for volumes, optional for env vars"
															type:        "string"
														}
														divisor: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
															pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
															"x-kubernetes-int-or-string": true
														}
														resource: {
															description: "Required: resource to select"
															type:        "string"
														}
													}
													required: ["resource"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												secretKeyRef: {
													description: "Selects a key of a secret in the pod's namespace"
													properties: {
														key: {
															description: "The key of the secret to select from.  Must be a valid secret key."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
															type:        "string"
														}
														optional: {
															description: "Specify whether the Secret or its key must be defined"
															type:        "boolean"
														}
													}
													required: ["key"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											type: "object"
										}
									}
									required: ["name"]
									type: "object"
								}
								type: "array"
							}
							envFrom: {
								description: "List of sources to populate environment variables on the OpAMPBridge Pods."
								items: {
									description: "EnvFromSource represents the source of a set of ConfigMaps"
									properties: {
										configMapRef: {
											description: "The ConfigMap to select from"
											properties: {
												name: {
													description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
													type:        "string"
												}
												optional: {
													description: "Specify whether the ConfigMap must be defined"
													type:        "boolean"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										prefix: {
											description: "An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER."
											type:        "string"
										}
										secretRef: {
											description: "The Secret to select from"
											properties: {
												name: {
													description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
													type:        "string"
												}
												optional: {
													description: "Specify whether the Secret must be defined"
													type:        "boolean"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
									}
									type: "object"
								}
								type: "array"
							}
							headers: {
								additionalProperties: type: "string"
								description: "Headers is an optional map of headers to use when connecting to the OpAMP Server, typically used to set access tokens or other authorization headers."
								type:        "object"
							}
							hostNetwork: {
								description: "HostNetwork indicates if the pod should run in the host networking namespace."
								type:        "boolean"
							}
							image: {
								description: "Image indicates the container image to use for the OpAMPBridge."
								type:        "string"
							}
							imagePullPolicy: {
								description: "ImagePullPolicy indicates the pull policy to be used for retrieving the container image (Always, Never, IfNotPresent)"
								type:        "string"
							}
							nodeSelector: {
								additionalProperties: type: "string"
								description: "NodeSelector to schedule OpAMPBridge pods."
								type:        "object"
							}
							podAnnotations: {
								additionalProperties: type: "string"
								description: "PodAnnotations is the set of annotations that will be attached to OpAMPBridge pods."
								type:        "object"
							}
							podSecurityContext: {
								description: "PodSecurityContext will be set as the pod security context."
								properties: {
									fsGroup: {
										description: """
		A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod: 
		 1.
		"""
										format: "int64"
										type:   "integer"
									}
									fsGroupChangePolicy: {
										description: "fsGroupChangePolicy defines behavior of changing ownership and permission of the volume before being exposed inside Pod."
										type:        "string"
									}
									runAsGroup: {
										description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext."
										format:      "int64"
										type:        "integer"
									}
									runAsNonRoot: {
										description: "Indicates that the container must run as a non-root user."
										type:        "boolean"
									}
									runAsUser: {
										description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext."
										format:      "int64"
										type:        "integer"
									}
									seLinuxOptions: {
										description: "The SELinux context to be applied to all containers. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in SecurityContext."
										properties: {
											level: {
												description: "Level is SELinux level label that applies to the container."
												type:        "string"
											}
											role: {
												description: "Role is a SELinux role label that applies to the container."
												type:        "string"
											}
											type: {
												description: "Type is a SELinux type label that applies to the container."
												type:        "string"
											}
											user: {
												description: "User is a SELinux user label that applies to the container."
												type:        "string"
											}
										}
										type: "object"
									}
									seccompProfile: {
										description: "The seccomp options to use by the containers in this pod. Note that this field cannot be set when spec.os.name is windows."
										properties: {
											localhostProfile: {
												description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
												type:        "string"
											}
											type: {
												description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
												type: "string"
											}
										}
										required: ["type"]
										type: "object"
									}
									supplementalGroups: {
										description: "A list of groups applied to the first process run in each container, in addition to the container's primary GID, the fsGroup (if specified), and group memberships defined in the container image for th"
										items: {
											format: "int64"
											type:   "integer"
										}
										type: "array"
									}
									sysctls: {
										description: "Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls (by the container runtime) might fail to launch. Note that this field cannot be set when spec.os."
										items: {
											description: "Sysctl defines a kernel parameter to be set"
											properties: {
												name: {
													description: "Name of a property to set"
													type:        "string"
												}
												value: {
													description: "Value of a property to set"
													type:        "string"
												}
											}
											required: [
												"name",
												"value",
											]
											type: "object"
										}
										type: "array"
									}
									windowsOptions: {
										description: "The Windows specific settings applied to all containers. If unspecified, the options within a container's SecurityContext will be used."
										properties: {
											gmsaCredentialSpec: {
												description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
												type:        "string"
											}
											gmsaCredentialSpecName: {
												description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
												type:        "string"
											}
											hostProcess: {
												description: "HostProcess determines if a container should be run as a 'Host Process' container."
												type:        "boolean"
											}
											runAsUserName: {
												description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
												type:        "string"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							ports: {
								description: "Ports allows a set of ports to be exposed by the underlying v1.Service."
								items: {
									description: "ServicePort contains information on service's port."
									properties: {
										appProtocol: {
											description: "The application protocol for this port. This is used as a hint for implementations to offer richer behavior for protocols that they understand. This field follows standard Kubernetes label syntax."
											type:        "string"
										}
										name: {
											description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names."
											type:        "string"
										}
										nodePort: {
											description: "The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system."
											format:      "int32"
											type:        "integer"
										}
										port: {
											description: "The port that will be exposed by this service."
											format:      "int32"
											type:        "integer"
										}
										protocol: {
											default:     "TCP"
											description: "The IP protocol for this port. Supports \"TCP\", \"UDP\", and \"SCTP\". Default is TCP."
											type:        "string"
										}
										targetPort: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											description:                  "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
											"x-kubernetes-int-or-string": true
										}
									}
									required: ["port"]
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
							priorityClassName: {
								description: "If specified, indicates the pod's priority. If not specified, the pod priority will be default or zero if there is no default."
								type:        "string"
							}
							replicas: {
								description: "Replicas is the number of pod instances for the OpAMPBridge."
								format:      "int32"
								maximum:     1
								type:        "integer"
							}
							resources: {
								description: "Resources to set on the OpAMPBridge pods."
								properties: {
									claims: {
										description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
										items: {
											description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
											properties: name: {
												description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
												type:        "string"
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
										"x-kubernetes-list-map-keys": ["name"]
										"x-kubernetes-list-type": "map"
									}
									limits: {
										additionalProperties: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											"x-kubernetes-int-or-string": true
										}
										description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
										type:        "object"
									}
									requests: {
										additionalProperties: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											"x-kubernetes-int-or-string": true
										}
										description: "Requests describes the minimum amount of compute resources required."
										type:        "object"
									}
								}
								type: "object"
							}
							securityContext: {
								description: "SecurityContext will be set as the container security context."
								properties: {
									allowPrivilegeEscalation: {
										description: "AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process."
										type:        "boolean"
									}
									capabilities: {
										description: "The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime. Note that this field cannot be set when spec.os.name is windows."
										properties: {
											add: {
												description: "Added capabilities"
												items: {
													description: "Capability represent POSIX capabilities type"
													type:        "string"
												}
												type: "array"
											}
											drop: {
												description: "Removed capabilities"
												items: {
													description: "Capability represent POSIX capabilities type"
													type:        "string"
												}
												type: "array"
											}
										}
										type: "object"
									}
									privileged: {
										description: "Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows."
										type:        "boolean"
									}
									procMount: {
										description: "procMount denotes the type of proc mount to use for the containers. The default is DefaultProcMount which uses the container runtime defaults for readonly paths and masked paths."
										type:        "string"
									}
									readOnlyRootFilesystem: {
										description: "Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows."
										type:        "boolean"
									}
									runAsGroup: {
										description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext."
										format:      "int64"
										type:        "integer"
									}
									runAsNonRoot: {
										description: "Indicates that the container must run as a non-root user."
										type:        "boolean"
									}
									runAsUser: {
										description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext."
										format:      "int64"
										type:        "integer"
									}
									seLinuxOptions: {
										description: "The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext."
										properties: {
											level: {
												description: "Level is SELinux level label that applies to the container."
												type:        "string"
											}
											role: {
												description: "Role is a SELinux role label that applies to the container."
												type:        "string"
											}
											type: {
												description: "Type is a SELinux type label that applies to the container."
												type:        "string"
											}
											user: {
												description: "User is a SELinux user label that applies to the container."
												type:        "string"
											}
										}
										type: "object"
									}
									seccompProfile: {
										description: "The seccomp options to use by this container. If seccomp options are provided at both the pod & container level, the container options override the pod options."
										properties: {
											localhostProfile: {
												description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
												type:        "string"
											}
											type: {
												description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
												type: "string"
											}
										}
										required: ["type"]
										type: "object"
									}
									windowsOptions: {
										description: "The Windows specific settings applied to all containers. If unspecified, the options from the PodSecurityContext will be used."
										properties: {
											gmsaCredentialSpec: {
												description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
												type:        "string"
											}
											gmsaCredentialSpecName: {
												description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
												type:        "string"
											}
											hostProcess: {
												description: "HostProcess determines if a container should be run as a 'Host Process' container."
												type:        "boolean"
											}
											runAsUserName: {
												description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
												type:        "string"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							serviceAccount: {
								description: "ServiceAccount indicates the name of an existing service account to use with this instance. When set, the operator will not automatically create a ServiceAccount for the OpAMPBridge."
								type:        "string"
							}
							tolerations: {
								description: "Toleration to schedule OpAMPBridge pods."
								items: {
									description: "The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>."
									properties: {
										effect: {
											description: "Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute."
											type:        "string"
										}
										key: {
											description: "Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys."
											type:        "string"
										}
										operator: {
											description: "Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal."
											type:        "string"
										}
										tolerationSeconds: {
											description: "TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint."
											format:      "int64"
											type:        "integer"
										}
										value: {
											description: "Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string."
											type:        "string"
										}
									}
									type: "object"
								}
								type: "array"
							}
							topologySpreadConstraints: {
								description: "TopologySpreadConstraints embedded kubernetes pod configuration option, controls how pods are spread across your cluster among failure-domains such as regions, zones, nodes, and other user-defined top"
								items: {
									description: "TopologySpreadConstraint specifies how to spread matching pods among the given topology."
									properties: {
										labelSelector: {
											description: "LabelSelector is used to find matching pods. Pods that match this label selector are counted to determine the number of pods in their corresponding topology domain."
											properties: {
												matchExpressions: {
													description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
													items: {
														description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
														properties: {
															key: {
																description: "key is the label key that the selector applies to."
																type:        "string"
															}
															operator: {
																description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																type:        "string"
															}
															values: {
																description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																items: type: "string"
																type: "array"
															}
														}
														required: [
															"key",
															"operator",
														]
														type: "object"
													}
													type: "array"
												}
												matchLabels: {
													additionalProperties: type: "string"
													description: "matchLabels is a map of {key,value} pairs."
													type:        "object"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										matchLabelKeys: {
											description: "MatchLabelKeys is a set of pod label keys to select the pods over which spreading will be calculated."
											items: type: "string"
											type:                     "array"
											"x-kubernetes-list-type": "atomic"
										}
										maxSkew: {
											description: "MaxSkew describes the degree to which pods may be unevenly distributed."
											format:      "int32"
											type:        "integer"
										}
										minDomains: {
											description: "MinDomains indicates a minimum number of eligible domains."
											format:      "int32"
											type:        "integer"
										}
										nodeAffinityPolicy: {
											description: "NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when calculating pod topology spread skew."
											type:        "string"
										}
										nodeTaintsPolicy: {
											description: "NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology spread skew."
											type:        "string"
										}
										topologyKey: {
											description: "TopologyKey is the key of node labels. Nodes that have a label with this key and identical values are considered to be in the same topology."
											type:        "string"
										}
										whenUnsatisfiable: {
											description: "WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it."
											type:        "string"
										}
									}
									required: [
										"maxSkew",
										"topologyKey",
										"whenUnsatisfiable",
									]
									type: "object"
								}
								type: "array"
							}
							upgradeStrategy: {
								description: "UpgradeStrategy represents how the operator will handle upgrades to the CR when a newer version of the operator is deployed"
								enum: [
									"automatic",
									"none",
								]
								type: "string"
							}
							volumeMounts: {
								description: "VolumeMounts represents the mount points to use in the underlying OpAMPBridge deployment(s)"
								items: {
									description: "VolumeMount describes a mounting of a Volume within a container."
									properties: {
										mountPath: {
											description: "Path within the container at which the volume should be mounted.  Must not contain ':'."
											type:        "string"
										}
										mountPropagation: {
											description: "mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationNone is used. This field is beta in 1.10."
											type:        "string"
										}
										name: {
											description: "This must match the Name of a Volume."
											type:        "string"
										}
										readOnly: {
											description: "Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false."
											type:        "boolean"
										}
										subPath: {
											description: "Path within the volume from which the container's volume should be mounted. Defaults to \"\" (volume's root)."
											type:        "string"
										}
										subPathExpr: {
											description: "Expanded path within the volume from which the container's volume should be mounted."
											type:        "string"
										}
									}
									required: [
										"mountPath",
										"name",
									]
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
							volumes: {
								description: "Volumes represents which volumes to use in the underlying OpAMPBridge deployment(s)."
								items: {
									description: "Volume represents a named volume in a pod that may be accessed by any container in the pod."
									properties: {
										awsElasticBlockStore: {
											description: "awsElasticBlockStore represents an AWS Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes."
											properties: {
												fsType: {
													description: "fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												partition: {
													description: "partition is the partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as \"1\"."
													format:      "int32"
													type:        "integer"
												}
												readOnly: {
													description: "readOnly value true will force the readOnly setting in VolumeMounts. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore"
													type:        "boolean"
												}
												volumeID: {
													description: "volumeID is unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore"
													type:        "string"
												}
											}
											required: ["volumeID"]
											type: "object"
										}
										azureDisk: {
											description: "azureDisk represents an Azure Data Disk mount on the host and bind mount to the pod."
											properties: {
												cachingMode: {
													description: "cachingMode is the Host Caching mode: None, Read Only, Read Write."
													type:        "string"
												}
												diskName: {
													description: "diskName is the Name of the data disk in the blob storage"
													type:        "string"
												}
												diskURI: {
													description: "diskURI is the URI of data disk in the blob storage"
													type:        "string"
												}
												fsType: {
													description: "fsType is Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												kind: {
													description: "kind expected values are Shared: multiple blob disks per storage account  Dedicated: single blob disk per storage account  Managed: azure managed data disk (only in managed availability set)."
													type:        "string"
												}
												readOnly: {
													description: "readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
											}
											required: [
												"diskName",
												"diskURI",
											]
											type: "object"
										}
										azureFile: {
											description: "azureFile represents an Azure File Service mount on the host and bind mount to the pod."
											properties: {
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretName: {
													description: "secretName is the  name of secret that contains Azure Storage Account Name and Key"
													type:        "string"
												}
												shareName: {
													description: "shareName is the azure share Name"
													type:        "string"
												}
											}
											required: [
												"secretName",
												"shareName",
											]
											type: "object"
										}
										cephfs: {
											description: "cephFS represents a Ceph FS mount on the host that shares a pod's lifetime"
											properties: {
												monitors: {
													description: "monitors is Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													items: type: "string"
													type: "array"
												}
												path: {
													description: "path is Optional: Used as the mounted root, rather than the full Ceph tree, default is /"
													type:        "string"
												}
												readOnly: {
													description: "readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													type:        "boolean"
												}
												secretFile: {
													description: "secretFile is Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													type:        "string"
												}
												secretRef: {
													description: "secretRef is Optional: SecretRef is reference to the authentication secret for User, default is empty. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												user: {
													description: "user is optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													type:        "string"
												}
											}
											required: ["monitors"]
											type: "object"
										}
										cinder: {
											description: "cinder represents a cinder volume attached and mounted on kubelets host machine. More info: https://examples.k8s.io/mysql-cinder-pd/README.md"
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md"
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is optional: points to a secret object containing parameters used to connect to OpenStack."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												volumeID: {
													description: "volumeID used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md"
													type:        "string"
												}
											}
											required: ["volumeID"]
											type: "object"
										}
										configMap: {
											description: "configMap represents a configMap that should populate this volume"
											properties: {
												defaultMode: {
													description: "defaultMode is optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
													format:      "int32"
													type:        "integer"
												}
												items: {
													description: "items if unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value."
													items: {
														description: "Maps a string key to a path within a volume."
														properties: {
															key: {
																description: "key is the key to project."
																type:        "string"
															}
															mode: {
																description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																format:      "int32"
																type:        "integer"
															}
															path: {
																description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																type:        "string"
															}
														}
														required: [
															"key",
															"path",
														]
														type: "object"
													}
													type: "array"
												}
												name: {
													description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
													type:        "string"
												}
												optional: {
													description: "optional specify whether the ConfigMap or its keys must be defined"
													type:        "boolean"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										csi: {
											description: "csi (Container Storage Interface) represents ephemeral storage that is handled by certain external CSI drivers (Beta feature)."
											properties: {
												driver: {
													description: "driver is the name of the CSI driver that handles this volume. Consult with your admin for the correct name as registered in the cluster."
													type:        "string"
												}
												fsType: {
													description: "fsType to mount. Ex. \"ext4\", \"xfs\", \"ntfs\". If not provided, the empty value is passed to the associated CSI driver which will determine the default filesystem to apply."
													type:        "string"
												}
												nodePublishSecretRef: {
													description: "nodePublishSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI NodePublishVolume and NodeUnpublishVolume calls."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												readOnly: {
													description: "readOnly specifies a read-only configuration for the volume. Defaults to false (read/write)."
													type:        "boolean"
												}
												volumeAttributes: {
													additionalProperties: type: "string"
													description: "volumeAttributes stores driver-specific properties that are passed to the CSI driver. Consult your driver's documentation for supported values."
													type:        "object"
												}
											}
											required: ["driver"]
											type: "object"
										}
										downwardAPI: {
											description: "downwardAPI represents downward API about the pod that should populate this volume"
											properties: {
												defaultMode: {
													description: "Optional: mode bits to use on created files by default. Must be a Optional: mode bits used to set permissions on created files by default."
													format:      "int32"
													type:        "integer"
												}
												items: {
													description: "Items is a list of downward API volume file"
													items: {
														description: "DownwardAPIVolumeFile represents information to create the file containing the pod field"
														properties: {
															fieldRef: {
																description: "Required: Selects a field of the pod: only annotations, labels, name and namespace are supported."
																properties: {
																	apiVersion: {
																		description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																		type:        "string"
																	}
																	fieldPath: {
																		description: "Path of the field to select in the specified API version."
																		type:        "string"
																	}
																}
																required: ["fieldPath"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															mode: {
																description: "Optional: mode bits used to set permissions on this file, must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																format:      "int32"
																type:        "integer"
															}
															path: {
																description: "Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'"
																type:        "string"
															}
															resourceFieldRef: {
																description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported."
																properties: {
																	containerName: {
																		description: "Container name: required for volumes, optional for env vars"
																		type:        "string"
																	}
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: {
																		description: "Required: resource to select"
																		type:        "string"
																	}
																}
																required: ["resource"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														required: ["path"]
														type: "object"
													}
													type: "array"
												}
											}
											type: "object"
										}
										emptyDir: {
											description: "emptyDir represents a temporary directory that shares a pod's lifetime. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir"
											properties: {
												medium: {
													description: "medium represents what type of storage medium should back this directory. The default is \"\" which means to use the node's default medium. Must be an empty string (default) or Memory."
													type:        "string"
												}
												sizeLimit: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													description:                  "sizeLimit is the total amount of local storage required for this EmptyDir volume. The size limit is also applicable for memory medium."
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
											}
											type: "object"
										}
										ephemeral: {
											description: "ephemeral represents a volume that is handled by a cluster storage driver."
											properties: volumeClaimTemplate: {
												description: "Will be used to create a stand-alone PVC to provision the volume. The pod in which this EphemeralVolumeSource is embedded will be the owner of the PVC, i.e."
												properties: {
													metadata: {
														description: "May contain labels and annotations that will be copied into the PVC when creating it. No other fields are allowed and will be rejected during validation."
														properties: {
															annotations: {
																additionalProperties: type: "string"
																type: "object"
															}
															finalizers: {
																items: type: "string"
																type: "array"
															}
															labels: {
																additionalProperties: type: "string"
																type: "object"
															}
															name: type:      "string"
															namespace: type: "string"
														}
														type: "object"
													}
													spec: {
														description: "The specification for the PersistentVolumeClaim. The entire content is copied unchanged into the PVC that gets created from this template."
														properties: {
															accessModes: {
																description: "accessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1"
																items: type: "string"
																type: "array"
															}
															dataSource: {
																description: "dataSource field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s."
																properties: {
																	apiGroup: {
																		description: "APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required."
																		type:        "string"
																	}
																	kind: {
																		description: "Kind is the type of resource being referenced"
																		type:        "string"
																	}
																	name: {
																		description: "Name is the name of resource being referenced"
																		type:        "string"
																	}
																}
																required: [
																	"kind",
																	"name",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															dataSourceRef: {
																description: "dataSourceRef specifies the object from which to populate the volume with data, if a non-empty volume is desired."
																properties: {
																	apiGroup: {
																		description: "APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required."
																		type:        "string"
																	}
																	kind: {
																		description: "Kind is the type of resource being referenced"
																		type:        "string"
																	}
																	name: {
																		description: "Name is the name of resource being referenced"
																		type:        "string"
																	}
																	namespace: {
																		description: "Namespace is the namespace of resource being referenced Note that when a namespace is specified, a gateway.networking.k8s."
																		type:        "string"
																	}
																}
																required: [
																	"kind",
																	"name",
																]
																type: "object"
															}
															resources: {
																description: "resources represents the minimum resources the volume should have."
																properties: {
																	limits: {
																		additionalProperties: {
																			anyOf: [{
																				type: "integer"
																			}, {
																				type: "string"
																			}]
																			pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																			"x-kubernetes-int-or-string": true
																		}
																		description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
																		type:        "object"
																	}
																	requests: {
																		additionalProperties: {
																			anyOf: [{
																				type: "integer"
																			}, {
																				type: "string"
																			}]
																			pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																			"x-kubernetes-int-or-string": true
																		}
																		description: "Requests describes the minimum amount of compute resources required."
																		type:        "object"
																	}
																}
																type: "object"
															}
															selector: {
																description: "selector is a label query over volumes to consider for binding."
																properties: {
																	matchExpressions: {
																		description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																		items: {
																			description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																			properties: {
																				key: {
																					description: "key is the label key that the selector applies to."
																					type:        "string"
																				}
																				operator: {
																					description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																					type:        "string"
																				}
																				values: {
																					description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																					items: type: "string"
																					type: "array"
																				}
																			}
																			required: [
																				"key",
																				"operator",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	matchLabels: {
																		additionalProperties: type: "string"
																		description: "matchLabels is a map of {key,value} pairs."
																		type:        "object"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															storageClassName: {
																description: "storageClassName is the name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1"
																type:        "string"
															}
															volumeAttributesClassName: {
																description: "volumeAttributesClassName may be used to set the VolumeAttributesClass used by this claim."
																type:        "string"
															}
															volumeMode: {
																description: "volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec."
																type:        "string"
															}
															volumeName: {
																description: "volumeName is the binding reference to the PersistentVolume backing this claim."
																type:        "string"
															}
														}
														type: "object"
													}
												}
												required: ["spec"]
												type: "object"
											}
											type: "object"
										}
										fc: {
											description: "fc represents a Fibre Channel resource that is attached to a kubelet's host machine and then exposed to the pod."
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												lun: {
													description: "lun is Optional: FC target lun number"
													format:      "int32"
													type:        "integer"
												}
												readOnly: {
													description: "readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												targetWWNs: {
													description: "targetWWNs is Optional: FC target worldwide names (WWNs)"
													items: type: "string"
													type: "array"
												}
												wwids: {
													description: "wwids Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously."
													items: type: "string"
													type: "array"
												}
											}
											type: "object"
										}
										flexVolume: {
											description: "flexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin."
											properties: {
												driver: {
													description: "driver is the name of the driver to use for this volume."
													type:        "string"
												}
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". The default filesystem depends on FlexVolume script."
													type:        "string"
												}
												options: {
													additionalProperties: type: "string"
													description: "options is Optional: this field holds extra command options if any."
													type:        "object"
												}
												readOnly: {
													description: "readOnly is Optional: defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is Optional: secretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											required: ["driver"]
											type: "object"
										}
										flocker: {
											description: "flocker represents a Flocker volume attached to a kubelet's host machine. This depends on the Flocker control service being running"
											properties: {
												datasetName: {
													description: "datasetName is Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated"
													type:        "string"
												}
												datasetUUID: {
													description: "datasetUUID is the UUID of the dataset. This is unique identifier of a Flocker dataset"
													type:        "string"
												}
											}
											type: "object"
										}
										gcePersistentDisk: {
											description: "gcePersistentDisk represents a GCE Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes."
											properties: {
												fsType: {
													description: "fsType is filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												partition: {
													description: "partition is the partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as \"1\"."
													format:      "int32"
													type:        "integer"
												}
												pdName: {
													description: "pdName is unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk"
													type:        "boolean"
												}
											}
											required: ["pdName"]
											type: "object"
										}
										gitRepo: {
											description: "gitRepo represents a git repository at a particular revision. DEPRECATED: GitRepo is deprecated."
											properties: {
												directory: {
													description: "directory is the target directory name. Must not contain or start with '..'.  If '.' is supplied, the volume directory will be the git repository."
													type:        "string"
												}
												repository: {
													description: "repository is the URL"
													type:        "string"
												}
												revision: {
													description: "revision is the commit hash for the specified revision."
													type:        "string"
												}
											}
											required: ["repository"]
											type: "object"
										}
										glusterfs: {
											description: "glusterfs represents a Glusterfs mount on the host that shares a pod's lifetime. More info: https://examples.k8s.io/volumes/glusterfs/README.md"
											properties: {
												endpoints: {
													description: "endpoints is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod"
													type:        "string"
												}
												path: {
													description: "path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod"
													type:        "boolean"
												}
											}
											required: [
												"endpoints",
												"path",
											]
											type: "object"
										}
										hostPath: {
											description: "hostPath represents a pre-existing file or directory on the host machine that is directly exposed to the container."
											properties: {
												path: {
													description: "path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath"
													type:        "string"
												}
												type: {
													description: "type for HostPath Volume Defaults to \"\" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath"
													type:        "string"
												}
											}
											required: ["path"]
											type: "object"
										}
										iscsi: {
											description: "iscsi represents an ISCSI Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://examples.k8s.io/volumes/iscsi/README.md"
											properties: {
												chapAuthDiscovery: {
													description: "chapAuthDiscovery defines whether support iSCSI Discovery CHAP authentication"
													type:        "boolean"
												}
												chapAuthSession: {
													description: "chapAuthSession defines whether support iSCSI Session CHAP authentication"
													type:        "boolean"
												}
												fsType: {
													description: "fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												initiatorName: {
													description: "initiatorName is the custom iSCSI Initiator Name."
													type:        "string"
												}
												iqn: {
													description: "iqn is the target iSCSI Qualified Name."
													type:        "string"
												}
												iscsiInterface: {
													description: "iscsiInterface is the interface Name that uses an iSCSI transport. Defaults to 'default' (tcp)."
													type:        "string"
												}
												lun: {
													description: "lun represents iSCSI Target Lun number."
													format:      "int32"
													type:        "integer"
												}
												portals: {
													description: "portals is the iSCSI Target Portal List. The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260)."
													items: type: "string"
													type: "array"
												}
												readOnly: {
													description: "readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is the CHAP Secret for iSCSI target and initiator authentication"
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												targetPortal: {
													description: "targetPortal is iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260)."
													type:        "string"
												}
											}
											required: [
												"iqn",
												"lun",
												"targetPortal",
											]
											type: "object"
										}
										name: {
											description: "name of the volume. Must be a DNS_LABEL and unique within the pod. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names"
											type:        "string"
										}
										nfs: {
											description: "nfs represents an NFS mount on the host that shares a pod's lifetime More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
											properties: {
												path: {
													description: "path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
													type:        "boolean"
												}
												server: {
													description: "server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
													type:        "string"
												}
											}
											required: [
												"path",
												"server",
											]
											type: "object"
										}
										persistentVolumeClaim: {
											description: "persistentVolumeClaimVolumeSource represents a reference to a PersistentVolumeClaim in the same namespace. More info: https://kubernetes."
											properties: {
												claimName: {
													description: "claimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims"
													type:        "string"
												}
												readOnly: {
													description: "readOnly Will force the ReadOnly setting in VolumeMounts. Default false."
													type:        "boolean"
												}
											}
											required: ["claimName"]
											type: "object"
										}
										photonPersistentDisk: {
											description: "photonPersistentDisk represents a PhotonController persistent disk attached and mounted on kubelets host machine"
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												pdID: {
													description: "pdID is the ID that identifies Photon Controller persistent disk"
													type:        "string"
												}
											}
											required: ["pdID"]
											type: "object"
										}
										portworxVolume: {
											description: "portworxVolume represents a portworx volume attached and mounted on kubelets host machine"
											properties: {
												fsType: {
													description: "fSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												volumeID: {
													description: "volumeID uniquely identifies a Portworx volume"
													type:        "string"
												}
											}
											required: ["volumeID"]
											type: "object"
										}
										projected: {
											description: "projected items for all in one resources secrets, configmaps, and downward API"
											properties: {
												defaultMode: {
													description: "defaultMode are the mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
													format:      "int32"
													type:        "integer"
												}
												sources: {
													description: "sources is the list of volume projections"
													items: {
														description: "Projection that may be projected along with other supported volume types"
														properties: {
															clusterTrustBundle: {
																description: """
		ClusterTrustBundle allows a pod to access the `.spec.trustBundle` field of ClusterTrustBundle objects in an auto-updating file. 
		 Alpha, gated by the ClusterTrustBundleProjection feature gate.
		"""
																properties: {
																	labelSelector: {
																		description: "Select all ClusterTrustBundles that match this label selector.  Only has effect if signerName is set.  Mutually-exclusive with name.  If unset, interpreted as \"match nothing\"."
																		properties: {
																			matchExpressions: {
																				description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																				items: {
																					description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																					properties: {
																						key: {
																							description: "key is the label key that the selector applies to."
																							type:        "string"
																						}
																						operator: {
																							description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																							type:        "string"
																						}
																						values: {
																							description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																							items: type: "string"
																							type: "array"
																						}
																					}
																					required: [
																						"key",
																						"operator",
																					]
																					type: "object"
																				}
																				type: "array"
																			}
																			matchLabels: {
																				additionalProperties: type: "string"
																				description: "matchLabels is a map of {key,value} pairs."
																				type:        "object"
																			}
																		}
																		type:                    "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	name: {
																		description: "Select a single ClusterTrustBundle by object name.  Mutually-exclusive with signerName and labelSelector."
																		type:        "string"
																	}
																	optional: {
																		description: "If true, don't block pod startup if the referenced ClusterTrustBundle(s) aren't available.  If using name, then the named ClusterTrustBundle is allowed not to exist."
																		type:        "boolean"
																	}
																	path: {
																		description: "Relative path from the volume root to write the bundle."
																		type:        "string"
																	}
																	signerName: {
																		description: "Select all ClusterTrustBundles that match this signer name. Mutually-exclusive with name.  The contents of all selected ClusterTrustBundles will be unified and deduplicated."
																		type:        "string"
																	}
																}
																required: ["path"]
																type: "object"
															}
															configMap: {
																description: "configMap information about the configMap data to project"
																properties: {
																	items: {
																		description: "items if unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value."
																		items: {
																			description: "Maps a string key to a path within a volume."
																			properties: {
																				key: {
																					description: "key is the key to project."
																					type:        "string"
																				}
																				mode: {
																					description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																					format:      "int32"
																					type:        "integer"
																				}
																				path: {
																					description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																					type:        "string"
																				}
																			}
																			required: [
																				"key",
																				"path",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "optional specify whether the ConfigMap or its keys must be defined"
																		type:        "boolean"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															downwardAPI: {
																description: "downwardAPI information about the downwardAPI data to project"
																properties: items: {
																	description: "Items is a list of DownwardAPIVolume file"
																	items: {
																		description: "DownwardAPIVolumeFile represents information to create the file containing the pod field"
																		properties: {
																			fieldRef: {
																				description: "Required: Selects a field of the pod: only annotations, labels, name and namespace are supported."
																				properties: {
																					apiVersion: {
																						description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																						type:        "string"
																					}
																					fieldPath: {
																						description: "Path of the field to select in the specified API version."
																						type:        "string"
																					}
																				}
																				required: ["fieldPath"]
																				type:                    "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			mode: {
																				description: "Optional: mode bits used to set permissions on this file, must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																				format:      "int32"
																				type:        "integer"
																			}
																			path: {
																				description: "Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'"
																				type:        "string"
																			}
																			resourceFieldRef: {
																				description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported."
																				properties: {
																					containerName: {
																						description: "Container name: required for volumes, optional for env vars"
																						type:        "string"
																					}
																					divisor: {
																						anyOf: [{
																							type: "integer"
																						}, {
																							type: "string"
																						}]
																						description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																						pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																						"x-kubernetes-int-or-string": true
																					}
																					resource: {
																						description: "Required: resource to select"
																						type:        "string"
																					}
																				}
																				required: ["resource"]
																				type:                    "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																		}
																		required: ["path"]
																		type: "object"
																	}
																	type: "array"
																}
																type: "object"
															}
															secret: {
																description: "secret information about the secret data to project"
																properties: {
																	items: {
																		description: "items if unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value."
																		items: {
																			description: "Maps a string key to a path within a volume."
																			properties: {
																				key: {
																					description: "key is the key to project."
																					type:        "string"
																				}
																				mode: {
																					description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																					format:      "int32"
																					type:        "integer"
																				}
																				path: {
																					description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																					type:        "string"
																				}
																			}
																			required: [
																				"key",
																				"path",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "optional field specify whether the Secret or its key must be defined"
																		type:        "boolean"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															serviceAccountToken: {
																description: "serviceAccountToken is information about the serviceAccountToken data to project"
																properties: {
																	audience: {
																		description: "audience is the intended audience of the token. A recipient of a token must identify itself with an identifier specified in the audience of the token, and otherwise should reject the token."
																		type:        "string"
																	}
																	expirationSeconds: {
																		description: "expirationSeconds is the requested duration of validity of the service account token. As the token approaches expiration, the kubelet volume plugin will proactively rotate the service account token."
																		format:      "int64"
																		type:        "integer"
																	}
																	path: {
																		description: "path is the path relative to the mount point of the file to project the token into."
																		type:        "string"
																	}
																}
																required: ["path"]
																type: "object"
															}
														}
														type: "object"
													}
													type: "array"
												}
											}
											type: "object"
										}
										quobyte: {
											description: "quobyte represents a Quobyte mount on the host that shares a pod's lifetime"
											properties: {
												group: {
													description: "group to map volume access to Default is no group"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false."
													type:        "boolean"
												}
												registry: {
													description: "registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes"
													type:        "string"
												}
												tenant: {
													description: "tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin"
													type:        "string"
												}
												user: {
													description: "user to map volume access to Defaults to serivceaccount user"
													type:        "string"
												}
												volume: {
													description: "volume is a string that references an already created Quobyte volume by name."
													type:        "string"
												}
											}
											required: [
												"registry",
												"volume",
											]
											type: "object"
										}
										rbd: {
											description: "rbd represents a Rados Block Device mount on the host that shares a pod's lifetime. More info: https://examples.k8s.io/volumes/rbd/README.md"
											properties: {
												fsType: {
													description: "fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												image: {
													description: "image is the rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
												keyring: {
													description: "keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
												monitors: {
													description: "monitors is a collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													items: type: "string"
													type: "array"
												}
												pool: {
													description: "pool is the rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is name of the authentication secret for RBDUser. If provided overrides keyring. Default is nil. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												user: {
													description: "user is the rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
											}
											required: [
												"image",
												"monitors",
											]
											type: "object"
										}
										scaleIO: {
											description: "scaleIO represents a ScaleIO persistent volume attached and mounted on Kubernetes nodes."
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Default is \"xfs\"."
													type:        "string"
												}
												gateway: {
													description: "gateway is the host address of the ScaleIO API Gateway."
													type:        "string"
												}
												protectionDomain: {
													description: "protectionDomain is the name of the ScaleIO Protection Domain for the configured storage."
													type:        "string"
												}
												readOnly: {
													description: "readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												sslEnabled: {
													description: "sslEnabled Flag enable/disable SSL communication with Gateway, default false"
													type:        "boolean"
												}
												storageMode: {
													description: "storageMode indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned."
													type:        "string"
												}
												storagePool: {
													description: "storagePool is the ScaleIO Storage Pool associated with the protection domain."
													type:        "string"
												}
												system: {
													description: "system is the name of the storage system as configured in ScaleIO."
													type:        "string"
												}
												volumeName: {
													description: "volumeName is the name of a volume already created in the ScaleIO system that is associated with this volume source."
													type:        "string"
												}
											}
											required: [
												"gateway",
												"secretRef",
												"system",
											]
											type: "object"
										}
										secret: {
											description: "secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret"
											properties: {
												defaultMode: {
													description: "defaultMode is Optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
													format:      "int32"
													type:        "integer"
												}
												items: {
													description: "items If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value."
													items: {
														description: "Maps a string key to a path within a volume."
														properties: {
															key: {
																description: "key is the key to project."
																type:        "string"
															}
															mode: {
																description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																format:      "int32"
																type:        "integer"
															}
															path: {
																description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																type:        "string"
															}
														}
														required: [
															"key",
															"path",
														]
														type: "object"
													}
													type: "array"
												}
												optional: {
													description: "optional field specify whether the Secret or its keys must be defined"
													type:        "boolean"
												}
												secretName: {
													description: "secretName is the name of the secret in the pod's namespace to use. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret"
													type:        "string"
												}
											}
											type: "object"
										}
										storageos: {
											description: "storageOS represents a StorageOS volume attached and mounted on Kubernetes nodes."
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												volumeName: {
													description: "volumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace."
													type:        "string"
												}
												volumeNamespace: {
													description: "volumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used."
													type:        "string"
												}
											}
											type: "object"
										}
										vsphereVolume: {
											description: "vsphereVolume represents a vSphere volume attached and mounted on kubelets host machine"
											properties: {
												fsType: {
													description: "fsType is filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												storagePolicyID: {
													description: "storagePolicyID is the storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName."
													type:        "string"
												}
												storagePolicyName: {
													description: "storagePolicyName is the storage Policy Based Management (SPBM) profile name."
													type:        "string"
												}
												volumePath: {
													description: "volumePath is the path that identifies vSphere volume vmdk"
													type:        "string"
												}
											}
											required: ["volumePath"]
											type: "object"
										}
									}
									required: ["name"]
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
						}
						required: [
							"capabilities",
							"endpoint",
						]
						type: "object"
					}
					status: {
						description: "OpAMPBridgeStatus defines the observed state of OpAMPBridge."
						properties: version: {
							description: "Version of the managed OpAMP Bridge (operand)"
							type:        "string"
						}
						type: "object"
					}
				}
				type: "object"
			}
			served:  true
			storage: true
			subresources: status: {}
		}]
	}
}
#CustomResourceDefinition: opentelemetrycollectors: {
	#config:    #Config
	apiVersion: "apiextensions.k8s.io/v1"
	kind:       "CustomResourceDefinition"
	metadata: {
		annotations: {
			"cert-manager.io/inject-ca-from":        "#\(#config.metadata.namespace)/\(#config.metadata.name)-serving-cert"
			"controller-gen.kubebuilder.io/version": "v0.12.0"
		}
		labels: "app.kubernetes.io/name": #config.metadata.name
		name: "opentelemetrycollectors.opentelemetry.io"
	}
	spec: {
		group: "opentelemetry.io"
		names: {
			kind:     "OpenTelemetryCollector"
			listKind: "OpenTelemetryCollectorList"
			plural:   "opentelemetrycollectors"
			shortNames: [
				"otelcol",
				"otelcols",
			]
			singular: "opentelemetrycollector"
		}
		scope: "Namespaced"
		versions: [{
			additionalPrinterColumns: [{
				description: "Deployment Mode"
				jsonPath:    ".spec.mode"
				name:        "Mode"
				type:        "string"
			}, {
				description: "OpenTelemetry Version"
				jsonPath:    ".status.version"
				name:        "Version"
				type:        "string"
			}, {
				jsonPath: ".status.scale.statusReplicas"
				name:     "Ready"
				type:     "string"
			}, {
				jsonPath: ".metadata.creationTimestamp"
				name:     "Age"
				type:     "date"
			}, {
				jsonPath: ".status.image"
				name:     "Image"
				type:     "string"
			}, {
				description: "Management State"
				jsonPath:    ".spec.managementState"
				name:        "Management"
				type:        "string"
			}]
			name: "v1alpha1"
			schema: openAPIV3Schema: {
				description: "OpenTelemetryCollector is the Schema for the opentelemetrycollectors API."
				properties: {
					apiVersion: {
						description: "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values."
						type:        "string"
					}
					kind: {
						description: "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase."
						type:        "string"
					}
					metadata: type: "object"
					spec: {
						description: "OpenTelemetryCollectorSpec defines the desired state of OpenTelemetryCollector."
						properties: {
							additionalContainers: {
								description: "AdditionalContainers allows injecting additional containers into the Collector's pod definition."
								items: {
									description: "A single application container that you want to run within a pod."
									properties: {
										args: {
											description: "Arguments to the entrypoint. The container image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment."
											items: type: "string"
											type: "array"
										}
										command: {
											description: "Entrypoint array. Not executed within a shell. The container image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment."
											items: type: "string"
											type: "array"
										}
										env: {
											description: "List of environment variables to set in the container. Cannot be updated."
											items: {
												description: "EnvVar represents an environment variable present in a Container."
												properties: {
													name: {
														description: "Name of the environment variable. Must be a C_IDENTIFIER."
														type:        "string"
													}
													value: {
														description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
														type:        "string"
													}
													valueFrom: {
														description: "Source for the environment variable's value. Cannot be used if value is not empty."
														properties: {
															configMapKeyRef: {
																description: "Selects a key of a ConfigMap."
																properties: {
																	key: {
																		description: "The key to select."
																		type:        "string"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "Specify whether the ConfigMap or its key must be defined"
																		type:        "boolean"
																	}
																}
																required: ["key"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															fieldRef: {
																description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
																properties: {
																	apiVersion: {
																		description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																		type:        "string"
																	}
																	fieldPath: {
																		description: "Path of the field to select in the specified API version."
																		type:        "string"
																	}
																}
																required: ["fieldPath"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															resourceFieldRef: {
																description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
																properties: {
																	containerName: {
																		description: "Container name: required for volumes, optional for env vars"
																		type:        "string"
																	}
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: {
																		description: "Required: resource to select"
																		type:        "string"
																	}
																}
																required: ["resource"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															secretKeyRef: {
																description: "Selects a key of a secret in the pod's namespace"
																properties: {
																	key: {
																		description: "The key of the secret to select from.  Must be a valid secret key."
																		type:        "string"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "Specify whether the Secret or its key must be defined"
																		type:        "boolean"
																	}
																}
																required: ["key"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														type: "object"
													}
												}
												required: ["name"]
												type: "object"
											}
											type: "array"
										}
										envFrom: {
											description: "List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER."
											items: {
												description: "EnvFromSource represents the source of a set of ConfigMaps"
												properties: {
													configMapRef: {
														description: "The ConfigMap to select from"
														properties: {
															name: {
																description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																type:        "string"
															}
															optional: {
																description: "Specify whether the ConfigMap must be defined"
																type:        "boolean"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													prefix: {
														description: "An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER."
														type:        "string"
													}
													secretRef: {
														description: "The Secret to select from"
														properties: {
															name: {
																description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																type:        "string"
															}
															optional: {
																description: "Specify whether the Secret must be defined"
																type:        "boolean"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											type: "array"
										}
										image: {
											description: "Container image name. More info: https://kubernetes."
											type:        "string"
										}
										imagePullPolicy: {
											description: "Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes."
											type:        "string"
										}
										lifecycle: {
											description: "Actions that the management system should take in response to container lifecycle events. Cannot be updated."
											properties: {
												postStart: {
													description: "PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy."
													properties: {
														exec: {
															description: "Exec specifies the action to take."
															properties: command: {
																description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															description: "HTTPGet specifies the http request to perform."
															properties: {
																host: {
																	description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
																	type:        "string"
																}
																httpHeaders: {
																	description: "Custom headers to set in the request. HTTP allows repeated headers."
																	items: {
																		description: "HTTPHeader describes a custom header to be used in HTTP probes"
																		properties: {
																			name: {
																				description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																				type:        "string"
																			}
																			value: {
																				description: "The header field value"
																				type:        "string"
																			}
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: {
																	description: "Path to access on the HTTP server."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
																scheme: {
																	description: "Scheme to use for connecting to the host. Defaults to HTTP."
																	type:        "string"
																}
															}
															required: ["port"]
															type: "object"
														}
														sleep: {
															description: "Sleep represents the duration that the container should sleep before being terminated."
															properties: seconds: {
																description: "Seconds is the number of seconds to sleep."
																format:      "int64"
																type:        "integer"
															}
															required: ["seconds"]
															type: "object"
														}
														tcpSocket: {
															description: "Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for the backward compatibility."
															properties: {
																host: {
																	description: "Optional: Host name to connect to, defaults to the pod IP."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
															}
															required: ["port"]
															type: "object"
														}
													}
													type: "object"
												}
												preStop: {
													description: "PreStop is called immediately before a container is terminated due to an API request or management event such as liveness/startup probe failure, preemption, resource contention, etc."
													properties: {
														exec: {
															description: "Exec specifies the action to take."
															properties: command: {
																description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															description: "HTTPGet specifies the http request to perform."
															properties: {
																host: {
																	description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
																	type:        "string"
																}
																httpHeaders: {
																	description: "Custom headers to set in the request. HTTP allows repeated headers."
																	items: {
																		description: "HTTPHeader describes a custom header to be used in HTTP probes"
																		properties: {
																			name: {
																				description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																				type:        "string"
																			}
																			value: {
																				description: "The header field value"
																				type:        "string"
																			}
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: {
																	description: "Path to access on the HTTP server."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
																scheme: {
																	description: "Scheme to use for connecting to the host. Defaults to HTTP."
																	type:        "string"
																}
															}
															required: ["port"]
															type: "object"
														}
														sleep: {
															description: "Sleep represents the duration that the container should sleep before being terminated."
															properties: seconds: {
																description: "Seconds is the number of seconds to sleep."
																format:      "int64"
																type:        "integer"
															}
															required: ["seconds"]
															type: "object"
														}
														tcpSocket: {
															description: "Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for the backward compatibility."
															properties: {
																host: {
																	description: "Optional: Host name to connect to, defaults to the pod IP."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
															}
															required: ["port"]
															type: "object"
														}
													}
													type: "object"
												}
											}
											type: "object"
										}
										livenessProbe: {
											description: "Periodic probe of container liveness. Container will be restarted if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
											properties: {
												exec: {
													description: "Exec specifies the action to take."
													properties: command: {
														description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												grpc: {
													description: "GRPC specifies an action involving a GRPC port."
													properties: {
														port: {
															description: "Port number of the gRPC service. Number must be in the range 1 to 65535."
															format:      "int32"
															type:        "integer"
														}
														service: {
															description: "Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md)."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												httpGet: {
													description: "HTTPGet specifies the http request to perform."
													properties: {
														host: {
															description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
															type:        "string"
														}
														httpHeaders: {
															description: "Custom headers to set in the request. HTTP allows repeated headers."
															items: {
																description: "HTTPHeader describes a custom header to be used in HTTP probes"
																properties: {
																	name: {
																		description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																		type:        "string"
																	}
																	value: {
																		description: "The header field value"
																		type:        "string"
																	}
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: {
															description: "Path to access on the HTTP server."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
														scheme: {
															description: "Scheme to use for connecting to the host. Defaults to HTTP."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												initialDelaySeconds: {
													description: "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
												periodSeconds: {
													description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												successThreshold: {
													description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												tcpSocket: {
													description: "TCPSocket specifies an action involving a TCP port."
													properties: {
														host: {
															description: "Optional: Host name to connect to, defaults to the pod IP."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
													}
													required: ["port"]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
													format:      "int64"
													type:        "integer"
												}
												timeoutSeconds: {
													description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
											}
											type: "object"
										}
										name: {
											description: "Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated."
											type:        "string"
										}
										ports: {
											description: "List of ports to expose from the container. Not specifying a port here DOES NOT prevent that port from being exposed. Any port which is listening on the default \"0.0.0."
											items: {
												description: "ContainerPort represents a network port in a single container."
												properties: {
													containerPort: {
														description: "Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536."
														format:      "int32"
														type:        "integer"
													}
													hostIP: {
														description: "What host IP to bind the external port to."
														type:        "string"
													}
													hostPort: {
														description: "Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this."
														format:      "int32"
														type:        "integer"
													}
													name: {
														description: "If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services."
														type:        "string"
													}
													protocol: {
														default:     "TCP"
														description: "Protocol for port. Must be UDP, TCP, or SCTP. Defaults to \"TCP\"."
														type:        "string"
													}
												}
												required: ["containerPort"]
												type: "object"
											}
											type: "array"
											"x-kubernetes-list-map-keys": [
												"containerPort",
												"protocol",
											]
											"x-kubernetes-list-type": "map"
										}
										readinessProbe: {
											description: "Periodic probe of container service readiness. Container will be removed from service endpoints if the probe fails. Cannot be updated. More info: https://kubernetes."
											properties: {
												exec: {
													description: "Exec specifies the action to take."
													properties: command: {
														description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												grpc: {
													description: "GRPC specifies an action involving a GRPC port."
													properties: {
														port: {
															description: "Port number of the gRPC service. Number must be in the range 1 to 65535."
															format:      "int32"
															type:        "integer"
														}
														service: {
															description: "Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md)."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												httpGet: {
													description: "HTTPGet specifies the http request to perform."
													properties: {
														host: {
															description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
															type:        "string"
														}
														httpHeaders: {
															description: "Custom headers to set in the request. HTTP allows repeated headers."
															items: {
																description: "HTTPHeader describes a custom header to be used in HTTP probes"
																properties: {
																	name: {
																		description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																		type:        "string"
																	}
																	value: {
																		description: "The header field value"
																		type:        "string"
																	}
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: {
															description: "Path to access on the HTTP server."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
														scheme: {
															description: "Scheme to use for connecting to the host. Defaults to HTTP."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												initialDelaySeconds: {
													description: "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
												periodSeconds: {
													description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												successThreshold: {
													description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												tcpSocket: {
													description: "TCPSocket specifies an action involving a TCP port."
													properties: {
														host: {
															description: "Optional: Host name to connect to, defaults to the pod IP."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
													}
													required: ["port"]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
													format:      "int64"
													type:        "integer"
												}
												timeoutSeconds: {
													description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
											}
											type: "object"
										}
										resizePolicy: {
											description: "Resources resize policy for the container."
											items: {
												description: "ContainerResizePolicy represents resource resize policy for the container."
												properties: {
													resourceName: {
														description: "Name of the resource to which this resource resize policy applies. Supported values: cpu, memory."
														type:        "string"
													}
													restartPolicy: {
														description: "Restart policy to apply when specified resource is resized. If not specified, it defaults to NotRequired."
														type:        "string"
													}
												}
												required: [
													"resourceName",
													"restartPolicy",
												]
												type: "object"
											}
											type:                     "array"
											"x-kubernetes-list-type": "atomic"
										}
										resources: {
											description: "Compute Resources required by this container. Cannot be updated. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
											properties: {
												claims: {
													description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
													items: {
														description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
														properties: name: {
															description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
															type:        "string"
														}
														required: ["name"]
														type: "object"
													}
													type: "array"
													"x-kubernetes-list-map-keys": ["name"]
													"x-kubernetes-list-type": "map"
												}
												limits: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
													type:        "object"
												}
												requests: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													description: "Requests describes the minimum amount of compute resources required."
													type:        "object"
												}
											}
											type: "object"
										}
										restartPolicy: {
											description: "RestartPolicy defines the restart behavior of individual containers in a pod. This field may only be set for init containers, and the only allowed value is \"Always\"."
											type:        "string"
										}
										securityContext: {
											description: "SecurityContext defines the security options the container should be run with. If set, the fields of SecurityContext override the equivalent fields of PodSecurityContext."
											properties: {
												allowPrivilegeEscalation: {
													description: "AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process."
													type:        "boolean"
												}
												capabilities: {
													description: "The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime. Note that this field cannot be set when spec.os.name is windows."
													properties: {
														add: {
															description: "Added capabilities"
															items: {
																description: "Capability represent POSIX capabilities type"
																type:        "string"
															}
															type: "array"
														}
														drop: {
															description: "Removed capabilities"
															items: {
																description: "Capability represent POSIX capabilities type"
																type:        "string"
															}
															type: "array"
														}
													}
													type: "object"
												}
												privileged: {
													description: "Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows."
													type:        "boolean"
												}
												procMount: {
													description: "procMount denotes the type of proc mount to use for the containers. The default is DefaultProcMount which uses the container runtime defaults for readonly paths and masked paths."
													type:        "string"
												}
												readOnlyRootFilesystem: {
													description: "Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows."
													type:        "boolean"
												}
												runAsGroup: {
													description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext."
													format:      "int64"
													type:        "integer"
												}
												runAsNonRoot: {
													description: "Indicates that the container must run as a non-root user."
													type:        "boolean"
												}
												runAsUser: {
													description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext."
													format:      "int64"
													type:        "integer"
												}
												seLinuxOptions: {
													description: "The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext."
													properties: {
														level: {
															description: "Level is SELinux level label that applies to the container."
															type:        "string"
														}
														role: {
															description: "Role is a SELinux role label that applies to the container."
															type:        "string"
														}
														type: {
															description: "Type is a SELinux type label that applies to the container."
															type:        "string"
														}
														user: {
															description: "User is a SELinux user label that applies to the container."
															type:        "string"
														}
													}
													type: "object"
												}
												seccompProfile: {
													description: "The seccomp options to use by this container. If seccomp options are provided at both the pod & container level, the container options override the pod options."
													properties: {
														localhostProfile: {
															description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
															type:        "string"
														}
														type: {
															description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
															type: "string"
														}
													}
													required: ["type"]
													type: "object"
												}
												windowsOptions: {
													description: "The Windows specific settings applied to all containers. If unspecified, the options from the PodSecurityContext will be used."
													properties: {
														gmsaCredentialSpec: {
															description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
															type:        "string"
														}
														gmsaCredentialSpecName: {
															description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
															type:        "string"
														}
														hostProcess: {
															description: "HostProcess determines if a container should be run as a 'Host Process' container."
															type:        "boolean"
														}
														runAsUserName: {
															description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
															type:        "string"
														}
													}
													type: "object"
												}
											}
											type: "object"
										}
										startupProbe: {
											description: "StartupProbe indicates that the Pod has successfully initialized. If specified, no other probes are executed until this completes successfully."
											properties: {
												exec: {
													description: "Exec specifies the action to take."
													properties: command: {
														description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												grpc: {
													description: "GRPC specifies an action involving a GRPC port."
													properties: {
														port: {
															description: "Port number of the gRPC service. Number must be in the range 1 to 65535."
															format:      "int32"
															type:        "integer"
														}
														service: {
															description: "Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md)."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												httpGet: {
													description: "HTTPGet specifies the http request to perform."
													properties: {
														host: {
															description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
															type:        "string"
														}
														httpHeaders: {
															description: "Custom headers to set in the request. HTTP allows repeated headers."
															items: {
																description: "HTTPHeader describes a custom header to be used in HTTP probes"
																properties: {
																	name: {
																		description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																		type:        "string"
																	}
																	value: {
																		description: "The header field value"
																		type:        "string"
																	}
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: {
															description: "Path to access on the HTTP server."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
														scheme: {
															description: "Scheme to use for connecting to the host. Defaults to HTTP."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												initialDelaySeconds: {
													description: "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
												periodSeconds: {
													description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												successThreshold: {
													description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												tcpSocket: {
													description: "TCPSocket specifies an action involving a TCP port."
													properties: {
														host: {
															description: "Optional: Host name to connect to, defaults to the pod IP."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
													}
													required: ["port"]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
													format:      "int64"
													type:        "integer"
												}
												timeoutSeconds: {
													description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
											}
											type: "object"
										}
										stdin: {
											description: "Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false."
											type:        "boolean"
										}
										stdinOnce: {
											description: "Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions."
											type:        "boolean"
										}
										terminationMessagePath: {
											description: "Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem."
											type:        "string"
										}
										terminationMessagePolicy: {
											description: "Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure."
											type:        "string"
										}
										tty: {
											description: "Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false."
											type:        "boolean"
										}
										volumeDevices: {
											description: "volumeDevices is the list of block devices to be used by the container."
											items: {
												description: "volumeDevice describes a mapping of a raw block device within a container."
												properties: {
													devicePath: {
														description: "devicePath is the path inside of the container that the device will be mapped to."
														type:        "string"
													}
													name: {
														description: "name must match the name of a persistentVolumeClaim in the pod"
														type:        "string"
													}
												}
												required: [
													"devicePath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										volumeMounts: {
											description: "Pod volumes to mount into the container's filesystem. Cannot be updated."
											items: {
												description: "VolumeMount describes a mounting of a Volume within a container."
												properties: {
													mountPath: {
														description: "Path within the container at which the volume should be mounted.  Must not contain ':'."
														type:        "string"
													}
													mountPropagation: {
														description: "mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationNone is used. This field is beta in 1.10."
														type:        "string"
													}
													name: {
														description: "This must match the Name of a Volume."
														type:        "string"
													}
													readOnly: {
														description: "Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false."
														type:        "boolean"
													}
													subPath: {
														description: "Path within the volume from which the container's volume should be mounted. Defaults to \"\" (volume's root)."
														type:        "string"
													}
													subPathExpr: {
														description: "Expanded path within the volume from which the container's volume should be mounted."
														type:        "string"
													}
												}
												required: [
													"mountPath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										workingDir: {
											description: "Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated."
											type:        "string"
										}
									}
									required: ["name"]
									type: "object"
								}
								type: "array"
							}
							affinity: {
								description: "If specified, indicates the pod's scheduling constraints"
								properties: {
									nodeAffinity: {
										description: "Describes node affinity scheduling rules for the pod."
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												description: "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
												items: {
													description: "An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op)."
													properties: {
														preference: {
															description: "A node selector term, associated with the corresponding weight."
															properties: {
																matchExpressions: {
																	description: "A list of node selector requirements by node's labels."
																	items: {
																		description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "The label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																				type:        "string"
																			}
																			values: {
																				description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchFields: {
																	description: "A list of node selector requirements by node's fields."
																	items: {
																		description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "The label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																				type:        "string"
																			}
																			values: {
																				description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														weight: {
															description: "Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100."
															format:      "int32"
															type:        "integer"
														}
													}
													required: [
														"preference",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												description: "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
												properties: nodeSelectorTerms: {
													description: "Required. A list of node selector terms. The terms are ORed."
													items: {
														description: "A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm."
														properties: {
															matchExpressions: {
																description: "A list of node selector requirements by node's labels."
																items: {
																	description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																	properties: {
																		key: {
																			description: "The label key that the selector applies to."
																			type:        "string"
																		}
																		operator: {
																			description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																			type:        "string"
																		}
																		values: {
																			description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
															matchFields: {
																description: "A list of node selector requirements by node's fields."
																items: {
																	description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																	properties: {
																		key: {
																			description: "The label key that the selector applies to."
																			type:        "string"
																		}
																		operator: {
																			description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																			type:        "string"
																		}
																		values: {
																			description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																			items: type: "string"
																			type: "array"
																		}
																	}
																	required: [
																		"key",
																		"operator",
																	]
																	type: "object"
																}
																type: "array"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													type: "array"
												}
												required: ["nodeSelectorTerms"]
												type:                    "object"
												"x-kubernetes-map-type": "atomic"
											}
										}
										type: "object"
									}
									podAffinity: {
										description: "Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s))."
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												description: "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
												items: {
													description: "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
													properties: {
														podAffinityTerm: {
															description: "Required. A pod affinity term, associated with the corresponding weight."
															properties: {
																labelSelector: {
																	description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																matchLabelKeys: {
																	description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																mismatchLabelKeys: {
																	description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																namespaceSelector: {
																	description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																	items: type: "string"
																	type: "array"
																}
																topologyKey: {
																	description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																	type:        "string"
																}
															}
															required: ["topologyKey"]
															type: "object"
														}
														weight: {
															description: "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
															format:      "int32"
															type:        "integer"
														}
													}
													required: [
														"podAffinityTerm",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												description: "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
												items: {
													description: "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-locate"
													properties: {
														labelSelector: {
															description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														matchLabelKeys: {
															description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														mismatchLabelKeys: {
															description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														namespaceSelector: {
															description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaces: {
															description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
															items: type: "string"
															type: "array"
														}
														topologyKey: {
															description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
															type:        "string"
														}
													}
													required: ["topologyKey"]
													type: "object"
												}
												type: "array"
											}
										}
										type: "object"
									}
									podAntiAffinity: {
										description: "Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s))."
										properties: {
											preferredDuringSchedulingIgnoredDuringExecution: {
												description: "The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
												items: {
													description: "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
													properties: {
														podAffinityTerm: {
															description: "Required. A pod affinity term, associated with the corresponding weight."
															properties: {
																labelSelector: {
																	description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																matchLabelKeys: {
																	description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																mismatchLabelKeys: {
																	description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																namespaceSelector: {
																	description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																	items: type: "string"
																	type: "array"
																}
																topologyKey: {
																	description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																	type:        "string"
																}
															}
															required: ["topologyKey"]
															type: "object"
														}
														weight: {
															description: "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
															format:      "int32"
															type:        "integer"
														}
													}
													required: [
														"podAffinityTerm",
														"weight",
													]
													type: "object"
												}
												type: "array"
											}
											requiredDuringSchedulingIgnoredDuringExecution: {
												description: "If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
												items: {
													description: "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-locate"
													properties: {
														labelSelector: {
															description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														matchLabelKeys: {
															description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														mismatchLabelKeys: {
															description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
															items: type: "string"
															type:                     "array"
															"x-kubernetes-list-type": "atomic"
														}
														namespaceSelector: {
															description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
															properties: {
																matchExpressions: {
																	description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																	items: {
																		description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																		properties: {
																			key: {
																				description: "key is the label key that the selector applies to."
																				type:        "string"
																			}
																			operator: {
																				description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																				type:        "string"
																			}
																			values: {
																				description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																				items: type: "string"
																				type: "array"
																			}
																		}
																		required: [
																			"key",
																			"operator",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																matchLabels: {
																	additionalProperties: type: "string"
																	description: "matchLabels is a map of {key,value} pairs."
																	type:        "object"
																}
															}
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														namespaces: {
															description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
															items: type: "string"
															type: "array"
														}
														topologyKey: {
															description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
															type:        "string"
														}
													}
													required: ["topologyKey"]
													type: "object"
												}
												type: "array"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							args: {
								additionalProperties: type: "string"
								description: "Args is the set of arguments to pass to the OpenTelemetry Collector binary"
								type:        "object"
							}
							autoscaler: {
								description: "Autoscaler specifies the pod autoscaling configuration to use for the OpenTelemetryCollector workload."
								properties: {
									behavior: {
										description: "HorizontalPodAutoscalerBehavior configures the scaling behavior of the target in both Up and Down directions (scaleUp and scaleDown fields respectively)."
										properties: {
											scaleDown: {
												description: "scaleDown is scaling policy for scaling Down. If not set, the default value is to allow to scale down to minReplicas pods, with a 300 second stabilization window (i.e."
												properties: {
													policies: {
														description: "policies is a list of potential scaling polices which can be used during scaling. At least one policy must be specified, otherwise the HPAScalingRules will be discarded as invalid"
														items: {
															description: "HPAScalingPolicy is a single policy which must hold true for a specified past interval."
															properties: {
																periodSeconds: {
																	description: "periodSeconds specifies the window of time for which the policy should hold true. PeriodSeconds must be greater than zero and less than or equal to 1800 (30 min)."
																	format:      "int32"
																	type:        "integer"
																}
																type: {
																	description: "type is used to specify the scaling policy."
																	type:        "string"
																}
																value: {
																	description: "value contains the amount of change which is permitted by the policy. It must be greater than zero"
																	format:      "int32"
																	type:        "integer"
																}
															}
															required: [
																"periodSeconds",
																"type",
																"value",
															]
															type: "object"
														}
														type:                     "array"
														"x-kubernetes-list-type": "atomic"
													}
													selectPolicy: {
														description: "selectPolicy is used to specify which policy should be used. If not set, the default value Max is used."
														type:        "string"
													}
													stabilizationWindowSeconds: {
														description: "stabilizationWindowSeconds is the number of seconds for which past recommendations should be considered while scaling up or scaling down."
														format:      "int32"
														type:        "integer"
													}
												}
												type: "object"
											}
											scaleUp: {
												description: "scaleUp is scaling policy for scaling Up."
												properties: {
													policies: {
														description: "policies is a list of potential scaling polices which can be used during scaling. At least one policy must be specified, otherwise the HPAScalingRules will be discarded as invalid"
														items: {
															description: "HPAScalingPolicy is a single policy which must hold true for a specified past interval."
															properties: {
																periodSeconds: {
																	description: "periodSeconds specifies the window of time for which the policy should hold true. PeriodSeconds must be greater than zero and less than or equal to 1800 (30 min)."
																	format:      "int32"
																	type:        "integer"
																}
																type: {
																	description: "type is used to specify the scaling policy."
																	type:        "string"
																}
																value: {
																	description: "value contains the amount of change which is permitted by the policy. It must be greater than zero"
																	format:      "int32"
																	type:        "integer"
																}
															}
															required: [
																"periodSeconds",
																"type",
																"value",
															]
															type: "object"
														}
														type:                     "array"
														"x-kubernetes-list-type": "atomic"
													}
													selectPolicy: {
														description: "selectPolicy is used to specify which policy should be used. If not set, the default value Max is used."
														type:        "string"
													}
													stabilizationWindowSeconds: {
														description: "stabilizationWindowSeconds is the number of seconds for which past recommendations should be considered while scaling up or scaling down."
														format:      "int32"
														type:        "integer"
													}
												}
												type: "object"
											}
										}
										type: "object"
									}
									maxReplicas: {
										description: "MaxReplicas sets an upper bound to the autoscaling feature. If MaxReplicas is set autoscaling is enabled."
										format:      "int32"
										type:        "integer"
									}
									metrics: {
										description: "Metrics is meant to provide a customizable way to configure HPA metrics. currently the only supported custom metrics is type=Pod."
										items: {
											description: "MetricSpec defines a subset of metrics to be defined for the HPA's metric array more metric type can be supported as needed. See https://pkg.go.dev/k8s.io/api/autoscaling/v2#MetricSpec for reference."
											properties: {
												pods: {
													description: "PodsMetricSource indicates how to scale on a metric describing each pod in the current scale target (for example, transactions-processed-per-second)."
													properties: {
														metric: {
															description: "metric identifies the target metric by name and selector"
															properties: {
																name: {
																	description: "name is the name of the given metric"
																	type:        "string"
																}
																selector: {
																	description: "selector is the string-encoded form of a standard kubernetes label selector for the given metric When set, it is passed as an additional parameter to the metrics server for more specific metrics scopi"
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
															}
															required: ["name"]
															type: "object"
														}
														target: {
															description: "target specifies the target value for the given metric"
															properties: {
																averageUtilization: {
																	description: "averageUtilization is the target value of the average of the resource metric across all relevant pods, represented as a percentage of the requested value of the resource for the pods."
																	format:      "int32"
																	type:        "integer"
																}
																averageValue: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "averageValue is the target value of the average of the metric across all relevant pods (as a quantity)"
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																type: {
																	description: "type represents whether the metric type is Utilization, Value, or AverageValue"
																	type:        "string"
																}
																value: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "value is the target value of the metric (as a quantity)."
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
															}
															required: ["type"]
															type: "object"
														}
													}
													required: [
														"metric",
														"target",
													]
													type: "object"
												}
												type: {
													description: "MetricSourceType indicates the type of metric."
													type:        "string"
												}
											}
											required: ["type"]
											type: "object"
										}
										type: "array"
									}
									minReplicas: {
										description: "MinReplicas sets a lower bound to the autoscaling feature.  Set this if your are using autoscaling. It must be at least 1"
										format:      "int32"
										type:        "integer"
									}
									targetCPUUtilization: {
										description: "TargetCPUUtilization sets the target average CPU used across all replicas. If average CPU exceeds this value, the HPA will scale up. Defaults to 90 percent."
										format:      "int32"
										type:        "integer"
									}
									targetMemoryUtilization: {
										description: "TargetMemoryUtilization sets the target average memory utilization across all replicas"
										format:      "int32"
										type:        "integer"
									}
								}
								type: "object"
							}
							config: {
								description: "Config is the raw JSON to be used as the collector's configuration. Refer to the OpenTelemetry Collector documentation for details."
								type:        "string"
							}
							configmaps: {
								description: "ConfigMaps is a list of ConfigMaps in the same namespace as the OpenTelemetryCollector object, which shall be mounted into the Collector Pods."
								items: {
									properties: {
										mountpath: type: "string"
										name: {
											description: "Configmap defines name and path where the configMaps should be mounted."
											type:        "string"
										}
									}
									required: [
										"mountpath",
										"name",
									]
									type: "object"
								}
								type: "array"
							}
							deploymentUpdateStrategy: {
								description: "UpdateStrategy represents the strategy the operator will take replacing existing Deployment pods with new pods https://kubernetes."
								properties: {
									rollingUpdate: {
										description: "Rolling update config params. Present only if DeploymentStrategyType = RollingUpdate. --- TODO: Update this to follow our convention for oneOf, whatever we decide it to be."
										properties: {
											maxSurge: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												description:                  "The maximum number of pods that can be scheduled above the desired number of pods. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%)."
												"x-kubernetes-int-or-string": true
											}
											maxUnavailable: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												description:                  "The maximum number of pods that can be unavailable during the update. Value can be an absolute number (ex: 5) or a percentage of desired pods (ex: 10%)."
												"x-kubernetes-int-or-string": true
											}
										}
										type: "object"
									}
									type: {
										description: "Type of deployment. Can be \"Recreate\" or \"RollingUpdate\". Default is RollingUpdate."
										type:        "string"
									}
								}
								type: "object"
							}
							env: {
								description: "ENV vars to set on the OpenTelemetry Collector's Pods. These can then in certain cases be consumed in the config file for the Collector."
								items: {
									description: "EnvVar represents an environment variable present in a Container."
									properties: {
										name: {
											description: "Name of the environment variable. Must be a C_IDENTIFIER."
											type:        "string"
										}
										value: {
											description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
											type:        "string"
										}
										valueFrom: {
											description: "Source for the environment variable's value. Cannot be used if value is not empty."
											properties: {
												configMapKeyRef: {
													description: "Selects a key of a ConfigMap."
													properties: {
														key: {
															description: "The key to select."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
															type:        "string"
														}
														optional: {
															description: "Specify whether the ConfigMap or its key must be defined"
															type:        "boolean"
														}
													}
													required: ["key"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												fieldRef: {
													description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
													properties: {
														apiVersion: {
															description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
															type:        "string"
														}
														fieldPath: {
															description: "Path of the field to select in the specified API version."
															type:        "string"
														}
													}
													required: ["fieldPath"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												resourceFieldRef: {
													description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
													properties: {
														containerName: {
															description: "Container name: required for volumes, optional for env vars"
															type:        "string"
														}
														divisor: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
															pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
															"x-kubernetes-int-or-string": true
														}
														resource: {
															description: "Required: resource to select"
															type:        "string"
														}
													}
													required: ["resource"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												secretKeyRef: {
													description: "Selects a key of a secret in the pod's namespace"
													properties: {
														key: {
															description: "The key of the secret to select from.  Must be a valid secret key."
															type:        "string"
														}
														name: {
															description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
															type:        "string"
														}
														optional: {
															description: "Specify whether the Secret or its key must be defined"
															type:        "boolean"
														}
													}
													required: ["key"]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											type: "object"
										}
									}
									required: ["name"]
									type: "object"
								}
								type: "array"
							}
							envFrom: {
								description: "List of sources to populate environment variables on the OpenTelemetry Collector's Pods. These can then in certain cases be consumed in the config file for the Collector."
								items: {
									description: "EnvFromSource represents the source of a set of ConfigMaps"
									properties: {
										configMapRef: {
											description: "The ConfigMap to select from"
											properties: {
												name: {
													description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
													type:        "string"
												}
												optional: {
													description: "Specify whether the ConfigMap must be defined"
													type:        "boolean"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										prefix: {
											description: "An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER."
											type:        "string"
										}
										secretRef: {
											description: "The Secret to select from"
											properties: {
												name: {
													description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
													type:        "string"
												}
												optional: {
													description: "Specify whether the Secret must be defined"
													type:        "boolean"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
									}
									type: "object"
								}
								type: "array"
							}
							hostNetwork: {
								description: "HostNetwork indicates if the pod should run in the host networking namespace."
								type:        "boolean"
							}
							image: {
								description: "Image indicates the container image to use for the OpenTelemetry Collector."
								type:        "string"
							}
							imagePullPolicy: {
								description: "ImagePullPolicy indicates the pull policy to be used for retrieving the container image (Always, Never, IfNotPresent)"
								type:        "string"
							}
							ingress: {
								description: "Ingress is used to specify how OpenTelemetry Collector is exposed. This functionality is only available if one of the valid modes is set. Valid modes are: deployment, daemonset and statefulset."
								properties: {
									annotations: {
										additionalProperties: type: "string"
										description: "Annotations to add to ingress. e.g. 'cert-manager.io/cluster-issuer: \"letsencrypt\"'"
										type:        "object"
									}
									hostname: {
										description: "Hostname by which the ingress proxy can be reached."
										type:        "string"
									}
									ingressClassName: {
										description: "IngressClassName is the name of an IngressClass cluster resource. Ingress controller implementations use this field to know whether they should be serving this Ingress resource."
										type:        "string"
									}
									route: {
										description: "Route is an OpenShift specific section that is only considered when type \"route\" is used."
										properties: termination: {
											description: "Termination indicates termination type. By default \"edge\" is used."
											enum: [
												"insecure",
												"edge",
												"passthrough",
												"reencrypt",
											]
											type: "string"
										}
										type: "object"
									}
									ruleType: {
										description: "RuleType defines how Ingress exposes collector receivers. IngressRuleTypePath (\"path\") exposes each receiver port on a unique path on single domain defined in Hostname."
										enum: [
											"path",
											"subdomain",
										]
										type: "string"
									}
									tls: {
										description: "TLS configuration."
										items: {
											description: "IngressTLS describes the transport layer security associated with an ingress."
											properties: {
												hosts: {
													description: "hosts is a list of hosts included in the TLS certificate. The values in this list must match the name/s used in the tlsSecret."
													items: type: "string"
													type:                     "array"
													"x-kubernetes-list-type": "atomic"
												}
												secretName: {
													description: "secretName is the name of the secret used to terminate TLS traffic on port 443. Field is left optional to allow TLS routing based on SNI hostname alone."
													type:        "string"
												}
											}
											type: "object"
										}
										type: "array"
									}
									type: {
										description: "Type default value is: \"\" Supported types are: ingress, route"
										enum: [
											"ingress",
											"route",
										]
										type: "string"
									}
								}
								type: "object"
							}
							initContainers: {
								description: "InitContainers allows injecting initContainers to the Collector's pod definition."
								items: {
									description: "A single application container that you want to run within a pod."
									properties: {
										args: {
											description: "Arguments to the entrypoint. The container image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment."
											items: type: "string"
											type: "array"
										}
										command: {
											description: "Entrypoint array. Not executed within a shell. The container image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment."
											items: type: "string"
											type: "array"
										}
										env: {
											description: "List of environment variables to set in the container. Cannot be updated."
											items: {
												description: "EnvVar represents an environment variable present in a Container."
												properties: {
													name: {
														description: "Name of the environment variable. Must be a C_IDENTIFIER."
														type:        "string"
													}
													value: {
														description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
														type:        "string"
													}
													valueFrom: {
														description: "Source for the environment variable's value. Cannot be used if value is not empty."
														properties: {
															configMapKeyRef: {
																description: "Selects a key of a ConfigMap."
																properties: {
																	key: {
																		description: "The key to select."
																		type:        "string"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "Specify whether the ConfigMap or its key must be defined"
																		type:        "boolean"
																	}
																}
																required: ["key"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															fieldRef: {
																description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
																properties: {
																	apiVersion: {
																		description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																		type:        "string"
																	}
																	fieldPath: {
																		description: "Path of the field to select in the specified API version."
																		type:        "string"
																	}
																}
																required: ["fieldPath"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															resourceFieldRef: {
																description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
																properties: {
																	containerName: {
																		description: "Container name: required for volumes, optional for env vars"
																		type:        "string"
																	}
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: {
																		description: "Required: resource to select"
																		type:        "string"
																	}
																}
																required: ["resource"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															secretKeyRef: {
																description: "Selects a key of a secret in the pod's namespace"
																properties: {
																	key: {
																		description: "The key of the secret to select from.  Must be a valid secret key."
																		type:        "string"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "Specify whether the Secret or its key must be defined"
																		type:        "boolean"
																	}
																}
																required: ["key"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														type: "object"
													}
												}
												required: ["name"]
												type: "object"
											}
											type: "array"
										}
										envFrom: {
											description: "List of sources to populate environment variables in the container. The keys defined within a source must be a C_IDENTIFIER."
											items: {
												description: "EnvFromSource represents the source of a set of ConfigMaps"
												properties: {
													configMapRef: {
														description: "The ConfigMap to select from"
														properties: {
															name: {
																description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																type:        "string"
															}
															optional: {
																description: "Specify whether the ConfigMap must be defined"
																type:        "boolean"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
													prefix: {
														description: "An optional identifier to prepend to each key in the ConfigMap. Must be a C_IDENTIFIER."
														type:        "string"
													}
													secretRef: {
														description: "The Secret to select from"
														properties: {
															name: {
																description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																type:        "string"
															}
															optional: {
																description: "Specify whether the Secret must be defined"
																type:        "boolean"
															}
														}
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											type: "array"
										}
										image: {
											description: "Container image name. More info: https://kubernetes."
											type:        "string"
										}
										imagePullPolicy: {
											description: "Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes."
											type:        "string"
										}
										lifecycle: {
											description: "Actions that the management system should take in response to container lifecycle events. Cannot be updated."
											properties: {
												postStart: {
													description: "PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy."
													properties: {
														exec: {
															description: "Exec specifies the action to take."
															properties: command: {
																description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															description: "HTTPGet specifies the http request to perform."
															properties: {
																host: {
																	description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
																	type:        "string"
																}
																httpHeaders: {
																	description: "Custom headers to set in the request. HTTP allows repeated headers."
																	items: {
																		description: "HTTPHeader describes a custom header to be used in HTTP probes"
																		properties: {
																			name: {
																				description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																				type:        "string"
																			}
																			value: {
																				description: "The header field value"
																				type:        "string"
																			}
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: {
																	description: "Path to access on the HTTP server."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
																scheme: {
																	description: "Scheme to use for connecting to the host. Defaults to HTTP."
																	type:        "string"
																}
															}
															required: ["port"]
															type: "object"
														}
														sleep: {
															description: "Sleep represents the duration that the container should sleep before being terminated."
															properties: seconds: {
																description: "Seconds is the number of seconds to sleep."
																format:      "int64"
																type:        "integer"
															}
															required: ["seconds"]
															type: "object"
														}
														tcpSocket: {
															description: "Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for the backward compatibility."
															properties: {
																host: {
																	description: "Optional: Host name to connect to, defaults to the pod IP."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
															}
															required: ["port"]
															type: "object"
														}
													}
													type: "object"
												}
												preStop: {
													description: "PreStop is called immediately before a container is terminated due to an API request or management event such as liveness/startup probe failure, preemption, resource contention, etc."
													properties: {
														exec: {
															description: "Exec specifies the action to take."
															properties: command: {
																description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
																items: type: "string"
																type: "array"
															}
															type: "object"
														}
														httpGet: {
															description: "HTTPGet specifies the http request to perform."
															properties: {
																host: {
																	description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
																	type:        "string"
																}
																httpHeaders: {
																	description: "Custom headers to set in the request. HTTP allows repeated headers."
																	items: {
																		description: "HTTPHeader describes a custom header to be used in HTTP probes"
																		properties: {
																			name: {
																				description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																				type:        "string"
																			}
																			value: {
																				description: "The header field value"
																				type:        "string"
																			}
																		}
																		required: [
																			"name",
																			"value",
																		]
																		type: "object"
																	}
																	type: "array"
																}
																path: {
																	description: "Path to access on the HTTP server."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
																scheme: {
																	description: "Scheme to use for connecting to the host. Defaults to HTTP."
																	type:        "string"
																}
															}
															required: ["port"]
															type: "object"
														}
														sleep: {
															description: "Sleep represents the duration that the container should sleep before being terminated."
															properties: seconds: {
																description: "Seconds is the number of seconds to sleep."
																format:      "int64"
																type:        "integer"
															}
															required: ["seconds"]
															type: "object"
														}
														tcpSocket: {
															description: "Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for the backward compatibility."
															properties: {
																host: {
																	description: "Optional: Host name to connect to, defaults to the pod IP."
																	type:        "string"
																}
																port: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
																	"x-kubernetes-int-or-string": true
																}
															}
															required: ["port"]
															type: "object"
														}
													}
													type: "object"
												}
											}
											type: "object"
										}
										livenessProbe: {
											description: "Periodic probe of container liveness. Container will be restarted if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
											properties: {
												exec: {
													description: "Exec specifies the action to take."
													properties: command: {
														description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												grpc: {
													description: "GRPC specifies an action involving a GRPC port."
													properties: {
														port: {
															description: "Port number of the gRPC service. Number must be in the range 1 to 65535."
															format:      "int32"
															type:        "integer"
														}
														service: {
															description: "Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md)."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												httpGet: {
													description: "HTTPGet specifies the http request to perform."
													properties: {
														host: {
															description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
															type:        "string"
														}
														httpHeaders: {
															description: "Custom headers to set in the request. HTTP allows repeated headers."
															items: {
																description: "HTTPHeader describes a custom header to be used in HTTP probes"
																properties: {
																	name: {
																		description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																		type:        "string"
																	}
																	value: {
																		description: "The header field value"
																		type:        "string"
																	}
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: {
															description: "Path to access on the HTTP server."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
														scheme: {
															description: "Scheme to use for connecting to the host. Defaults to HTTP."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												initialDelaySeconds: {
													description: "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
												periodSeconds: {
													description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												successThreshold: {
													description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												tcpSocket: {
													description: "TCPSocket specifies an action involving a TCP port."
													properties: {
														host: {
															description: "Optional: Host name to connect to, defaults to the pod IP."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
													}
													required: ["port"]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
													format:      "int64"
													type:        "integer"
												}
												timeoutSeconds: {
													description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
											}
											type: "object"
										}
										name: {
											description: "Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated."
											type:        "string"
										}
										ports: {
											description: "List of ports to expose from the container. Not specifying a port here DOES NOT prevent that port from being exposed. Any port which is listening on the default \"0.0.0."
											items: {
												description: "ContainerPort represents a network port in a single container."
												properties: {
													containerPort: {
														description: "Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536."
														format:      "int32"
														type:        "integer"
													}
													hostIP: {
														description: "What host IP to bind the external port to."
														type:        "string"
													}
													hostPort: {
														description: "Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this."
														format:      "int32"
														type:        "integer"
													}
													name: {
														description: "If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services."
														type:        "string"
													}
													protocol: {
														default:     "TCP"
														description: "Protocol for port. Must be UDP, TCP, or SCTP. Defaults to \"TCP\"."
														type:        "string"
													}
												}
												required: ["containerPort"]
												type: "object"
											}
											type: "array"
											"x-kubernetes-list-map-keys": [
												"containerPort",
												"protocol",
											]
											"x-kubernetes-list-type": "map"
										}
										readinessProbe: {
											description: "Periodic probe of container service readiness. Container will be removed from service endpoints if the probe fails. Cannot be updated. More info: https://kubernetes."
											properties: {
												exec: {
													description: "Exec specifies the action to take."
													properties: command: {
														description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												grpc: {
													description: "GRPC specifies an action involving a GRPC port."
													properties: {
														port: {
															description: "Port number of the gRPC service. Number must be in the range 1 to 65535."
															format:      "int32"
															type:        "integer"
														}
														service: {
															description: "Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md)."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												httpGet: {
													description: "HTTPGet specifies the http request to perform."
													properties: {
														host: {
															description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
															type:        "string"
														}
														httpHeaders: {
															description: "Custom headers to set in the request. HTTP allows repeated headers."
															items: {
																description: "HTTPHeader describes a custom header to be used in HTTP probes"
																properties: {
																	name: {
																		description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																		type:        "string"
																	}
																	value: {
																		description: "The header field value"
																		type:        "string"
																	}
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: {
															description: "Path to access on the HTTP server."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
														scheme: {
															description: "Scheme to use for connecting to the host. Defaults to HTTP."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												initialDelaySeconds: {
													description: "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
												periodSeconds: {
													description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												successThreshold: {
													description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												tcpSocket: {
													description: "TCPSocket specifies an action involving a TCP port."
													properties: {
														host: {
															description: "Optional: Host name to connect to, defaults to the pod IP."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
													}
													required: ["port"]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
													format:      "int64"
													type:        "integer"
												}
												timeoutSeconds: {
													description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
											}
											type: "object"
										}
										resizePolicy: {
											description: "Resources resize policy for the container."
											items: {
												description: "ContainerResizePolicy represents resource resize policy for the container."
												properties: {
													resourceName: {
														description: "Name of the resource to which this resource resize policy applies. Supported values: cpu, memory."
														type:        "string"
													}
													restartPolicy: {
														description: "Restart policy to apply when specified resource is resized. If not specified, it defaults to NotRequired."
														type:        "string"
													}
												}
												required: [
													"resourceName",
													"restartPolicy",
												]
												type: "object"
											}
											type:                     "array"
											"x-kubernetes-list-type": "atomic"
										}
										resources: {
											description: "Compute Resources required by this container. Cannot be updated. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
											properties: {
												claims: {
													description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
													items: {
														description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
														properties: name: {
															description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
															type:        "string"
														}
														required: ["name"]
														type: "object"
													}
													type: "array"
													"x-kubernetes-list-map-keys": ["name"]
													"x-kubernetes-list-type": "map"
												}
												limits: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
													type:        "object"
												}
												requests: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													description: "Requests describes the minimum amount of compute resources required."
													type:        "object"
												}
											}
											type: "object"
										}
										restartPolicy: {
											description: "RestartPolicy defines the restart behavior of individual containers in a pod. This field may only be set for init containers, and the only allowed value is \"Always\"."
											type:        "string"
										}
										securityContext: {
											description: "SecurityContext defines the security options the container should be run with. If set, the fields of SecurityContext override the equivalent fields of PodSecurityContext."
											properties: {
												allowPrivilegeEscalation: {
													description: "AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process."
													type:        "boolean"
												}
												capabilities: {
													description: "The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime. Note that this field cannot be set when spec.os.name is windows."
													properties: {
														add: {
															description: "Added capabilities"
															items: {
																description: "Capability represent POSIX capabilities type"
																type:        "string"
															}
															type: "array"
														}
														drop: {
															description: "Removed capabilities"
															items: {
																description: "Capability represent POSIX capabilities type"
																type:        "string"
															}
															type: "array"
														}
													}
													type: "object"
												}
												privileged: {
													description: "Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows."
													type:        "boolean"
												}
												procMount: {
													description: "procMount denotes the type of proc mount to use for the containers. The default is DefaultProcMount which uses the container runtime defaults for readonly paths and masked paths."
													type:        "string"
												}
												readOnlyRootFilesystem: {
													description: "Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows."
													type:        "boolean"
												}
												runAsGroup: {
													description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext."
													format:      "int64"
													type:        "integer"
												}
												runAsNonRoot: {
													description: "Indicates that the container must run as a non-root user."
													type:        "boolean"
												}
												runAsUser: {
													description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext."
													format:      "int64"
													type:        "integer"
												}
												seLinuxOptions: {
													description: "The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext."
													properties: {
														level: {
															description: "Level is SELinux level label that applies to the container."
															type:        "string"
														}
														role: {
															description: "Role is a SELinux role label that applies to the container."
															type:        "string"
														}
														type: {
															description: "Type is a SELinux type label that applies to the container."
															type:        "string"
														}
														user: {
															description: "User is a SELinux user label that applies to the container."
															type:        "string"
														}
													}
													type: "object"
												}
												seccompProfile: {
													description: "The seccomp options to use by this container. If seccomp options are provided at both the pod & container level, the container options override the pod options."
													properties: {
														localhostProfile: {
															description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
															type:        "string"
														}
														type: {
															description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
															type: "string"
														}
													}
													required: ["type"]
													type: "object"
												}
												windowsOptions: {
													description: "The Windows specific settings applied to all containers. If unspecified, the options from the PodSecurityContext will be used."
													properties: {
														gmsaCredentialSpec: {
															description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
															type:        "string"
														}
														gmsaCredentialSpecName: {
															description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
															type:        "string"
														}
														hostProcess: {
															description: "HostProcess determines if a container should be run as a 'Host Process' container."
															type:        "boolean"
														}
														runAsUserName: {
															description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
															type:        "string"
														}
													}
													type: "object"
												}
											}
											type: "object"
										}
										startupProbe: {
											description: "StartupProbe indicates that the Pod has successfully initialized. If specified, no other probes are executed until this completes successfully."
											properties: {
												exec: {
													description: "Exec specifies the action to take."
													properties: command: {
														description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
														items: type: "string"
														type: "array"
													}
													type: "object"
												}
												failureThreshold: {
													description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												grpc: {
													description: "GRPC specifies an action involving a GRPC port."
													properties: {
														port: {
															description: "Port number of the gRPC service. Number must be in the range 1 to 65535."
															format:      "int32"
															type:        "integer"
														}
														service: {
															description: "Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md)."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												httpGet: {
													description: "HTTPGet specifies the http request to perform."
													properties: {
														host: {
															description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
															type:        "string"
														}
														httpHeaders: {
															description: "Custom headers to set in the request. HTTP allows repeated headers."
															items: {
																description: "HTTPHeader describes a custom header to be used in HTTP probes"
																properties: {
																	name: {
																		description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																		type:        "string"
																	}
																	value: {
																		description: "The header field value"
																		type:        "string"
																	}
																}
																required: [
																	"name",
																	"value",
																]
																type: "object"
															}
															type: "array"
														}
														path: {
															description: "Path to access on the HTTP server."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
														scheme: {
															description: "Scheme to use for connecting to the host. Defaults to HTTP."
															type:        "string"
														}
													}
													required: ["port"]
													type: "object"
												}
												initialDelaySeconds: {
													description: "Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
												periodSeconds: {
													description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												successThreshold: {
													description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
													format:      "int32"
													type:        "integer"
												}
												tcpSocket: {
													description: "TCPSocket specifies an action involving a TCP port."
													properties: {
														host: {
															description: "Optional: Host name to connect to, defaults to the pod IP."
															type:        "string"
														}
														port: {
															anyOf: [{
																type: "integer"
															}, {
																type: "string"
															}]
															description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
															"x-kubernetes-int-or-string": true
														}
													}
													required: ["port"]
													type: "object"
												}
												terminationGracePeriodSeconds: {
													description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
													format:      "int64"
													type:        "integer"
												}
												timeoutSeconds: {
													description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
													format:      "int32"
													type:        "integer"
												}
											}
											type: "object"
										}
										stdin: {
											description: "Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false."
											type:        "boolean"
										}
										stdinOnce: {
											description: "Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions."
											type:        "boolean"
										}
										terminationMessagePath: {
											description: "Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem."
											type:        "string"
										}
										terminationMessagePolicy: {
											description: "Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure."
											type:        "string"
										}
										tty: {
											description: "Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false."
											type:        "boolean"
										}
										volumeDevices: {
											description: "volumeDevices is the list of block devices to be used by the container."
											items: {
												description: "volumeDevice describes a mapping of a raw block device within a container."
												properties: {
													devicePath: {
														description: "devicePath is the path inside of the container that the device will be mapped to."
														type:        "string"
													}
													name: {
														description: "name must match the name of a persistentVolumeClaim in the pod"
														type:        "string"
													}
												}
												required: [
													"devicePath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										volumeMounts: {
											description: "Pod volumes to mount into the container's filesystem. Cannot be updated."
											items: {
												description: "VolumeMount describes a mounting of a Volume within a container."
												properties: {
													mountPath: {
														description: "Path within the container at which the volume should be mounted.  Must not contain ':'."
														type:        "string"
													}
													mountPropagation: {
														description: "mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationNone is used. This field is beta in 1.10."
														type:        "string"
													}
													name: {
														description: "This must match the Name of a Volume."
														type:        "string"
													}
													readOnly: {
														description: "Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false."
														type:        "boolean"
													}
													subPath: {
														description: "Path within the volume from which the container's volume should be mounted. Defaults to \"\" (volume's root)."
														type:        "string"
													}
													subPathExpr: {
														description: "Expanded path within the volume from which the container's volume should be mounted."
														type:        "string"
													}
												}
												required: [
													"mountPath",
													"name",
												]
												type: "object"
											}
											type: "array"
										}
										workingDir: {
											description: "Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated."
											type:        "string"
										}
									}
									required: ["name"]
									type: "object"
								}
								type: "array"
							}
							lifecycle: {
								description: "Actions that the management system should take in response to container lifecycle events. Cannot be updated."
								properties: {
									postStart: {
										description: "PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy."
										properties: {
											exec: {
												description: "Exec specifies the action to take."
												properties: command: {
													description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
													items: type: "string"
													type: "array"
												}
												type: "object"
											}
											httpGet: {
												description: "HTTPGet specifies the http request to perform."
												properties: {
													host: {
														description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
														type:        "string"
													}
													httpHeaders: {
														description: "Custom headers to set in the request. HTTP allows repeated headers."
														items: {
															description: "HTTPHeader describes a custom header to be used in HTTP probes"
															properties: {
																name: {
																	description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																	type:        "string"
																}
																value: {
																	description: "The header field value"
																	type:        "string"
																}
															}
															required: [
																"name",
																"value",
															]
															type: "object"
														}
														type: "array"
													}
													path: {
														description: "Path to access on the HTTP server."
														type:        "string"
													}
													port: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
														"x-kubernetes-int-or-string": true
													}
													scheme: {
														description: "Scheme to use for connecting to the host. Defaults to HTTP."
														type:        "string"
													}
												}
												required: ["port"]
												type: "object"
											}
											sleep: {
												description: "Sleep represents the duration that the container should sleep before being terminated."
												properties: seconds: {
													description: "Seconds is the number of seconds to sleep."
													format:      "int64"
													type:        "integer"
												}
												required: ["seconds"]
												type: "object"
											}
											tcpSocket: {
												description: "Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for the backward compatibility."
												properties: {
													host: {
														description: "Optional: Host name to connect to, defaults to the pod IP."
														type:        "string"
													}
													port: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
														"x-kubernetes-int-or-string": true
													}
												}
												required: ["port"]
												type: "object"
											}
										}
										type: "object"
									}
									preStop: {
										description: "PreStop is called immediately before a container is terminated due to an API request or management event such as liveness/startup probe failure, preemption, resource contention, etc."
										properties: {
											exec: {
												description: "Exec specifies the action to take."
												properties: command: {
													description: "Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem."
													items: type: "string"
													type: "array"
												}
												type: "object"
											}
											httpGet: {
												description: "HTTPGet specifies the http request to perform."
												properties: {
													host: {
														description: "Host name to connect to, defaults to the pod IP. You probably want to set \"Host\" in httpHeaders instead."
														type:        "string"
													}
													httpHeaders: {
														description: "Custom headers to set in the request. HTTP allows repeated headers."
														items: {
															description: "HTTPHeader describes a custom header to be used in HTTP probes"
															properties: {
																name: {
																	description: "The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header."
																	type:        "string"
																}
																value: {
																	description: "The header field value"
																	type:        "string"
																}
															}
															required: [
																"name",
																"value",
															]
															type: "object"
														}
														type: "array"
													}
													path: {
														description: "Path to access on the HTTP server."
														type:        "string"
													}
													port: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														description:                  "Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
														"x-kubernetes-int-or-string": true
													}
													scheme: {
														description: "Scheme to use for connecting to the host. Defaults to HTTP."
														type:        "string"
													}
												}
												required: ["port"]
												type: "object"
											}
											sleep: {
												description: "Sleep represents the duration that the container should sleep before being terminated."
												properties: seconds: {
													description: "Seconds is the number of seconds to sleep."
													format:      "int64"
													type:        "integer"
												}
												required: ["seconds"]
												type: "object"
											}
											tcpSocket: {
												description: "Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for the backward compatibility."
												properties: {
													host: {
														description: "Optional: Host name to connect to, defaults to the pod IP."
														type:        "string"
													}
													port: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														description:                  "Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
														"x-kubernetes-int-or-string": true
													}
												}
												required: ["port"]
												type: "object"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							livenessProbe: {
								description: "Liveness config for the OpenTelemetry Collector except the probe handler which is auto generated from the health extension of the collector."
								properties: {
									failureThreshold: {
										description: "Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1."
										format:      "int32"
										type:        "integer"
									}
									initialDelaySeconds: {
										description: "Number of seconds after the container has started before liveness probes are initiated. Defaults to 0 seconds. Minimum value is 0. More info: https://kubernetes."
										format:      "int32"
										type:        "integer"
									}
									periodSeconds: {
										description: "How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1."
										format:      "int32"
										type:        "integer"
									}
									successThreshold: {
										description: "Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1."
										format:      "int32"
										type:        "integer"
									}
									terminationGracePeriodSeconds: {
										description: "Optional duration in seconds the pod needs to terminate gracefully upon probe failure."
										format:      "int64"
										type:        "integer"
									}
									timeoutSeconds: {
										description: "Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes"
										format:      "int32"
										type:        "integer"
									}
								}
								type: "object"
							}
							managementState: {
								default:     "managed"
								description: "ManagementState defines if the CR should be managed by the operator or not. Default is managed."
								enum: [
									"managed",
									"unmanaged",
								]
								type: "string"
							}
							maxReplicas: {
								description: "MaxReplicas sets an upper bound to the autoscaling feature. If MaxReplicas is set autoscaling is enabled. Deprecated: use \"OpenTelemetryCollector.Spec.Autoscaler.MaxReplicas\" instead."
								format:      "int32"
								type:        "integer"
							}
							minReplicas: {
								description: "MinReplicas sets a lower bound to the autoscaling feature.  Set this if you are using autoscaling. It must be at least 1 Deprecated: use \"OpenTelemetryCollector.Spec.Autoscaler.MinReplicas\" instead."
								format:      "int32"
								type:        "integer"
							}
							mode: {
								description: "Mode represents how the collector should be deployed (deployment, daemonset, statefulset or sidecar)"
								enum: [
									"daemonset",
									"deployment",
									"sidecar",
									"statefulset",
								]
								type: "string"
							}
							nodeSelector: {
								additionalProperties: type: "string"
								description: "NodeSelector to schedule OpenTelemetry Collector pods. This is only relevant to daemonset, statefulset, and deployment mode"
								type:        "object"
							}
							observability: {
								description: "ObservabilitySpec defines how telemetry data gets handled."
								properties: metrics: {
									description: "Metrics defines the metrics configuration for operands."
									properties: {
										DisablePrometheusAnnotations: {
											description: "DisablePrometheusAnnotations controls the automatic addition of default Prometheus annotations ('prometheus.io/scrape', 'prometheus.io/port', and 'prometheus.io/path')"
											type:        "boolean"
										}
										enableMetrics: {
											description: "EnableMetrics specifies if ServiceMonitor or PodMonitor(for sidecar mode) should be created for the service managed by the OpenTelemetry Operator. The operator.observability."
											type:        "boolean"
										}
									}
									type: "object"
								}
								type: "object"
							}
							podAnnotations: {
								additionalProperties: type: "string"
								description: "PodAnnotations is the set of annotations that will be attached to Collector and Target Allocator pods."
								type:        "object"
							}
							podDisruptionBudget: {
								description: "PodDisruptionBudget specifies the pod disruption budget configuration to use for the OpenTelemetryCollector workload."
								properties: {
									maxUnavailable: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "An eviction is allowed if at most \"maxUnavailable\" pods selected by \"selector\" are unavailable after the eviction, i.e. even in absence of the evicted pod."
										"x-kubernetes-int-or-string": true
									}
									minAvailable: {
										anyOf: [{
											type: "integer"
										}, {
											type: "string"
										}]
										description:                  "An eviction is allowed if at least \"minAvailable\" pods selected by \"selector\" will still be available after the eviction, i.e. even in the absence of the evicted pod."
										"x-kubernetes-int-or-string": true
									}
								}
								type: "object"
							}
							podSecurityContext: {
								description: "PodSecurityContext configures the pod security context for the opentelemetry-collector pod, when running as a deployment, daemonset, or statefulset."
								properties: {
									fsGroup: {
										description: """
		A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod: 
		 1.
		"""
										format: "int64"
										type:   "integer"
									}
									fsGroupChangePolicy: {
										description: "fsGroupChangePolicy defines behavior of changing ownership and permission of the volume before being exposed inside Pod."
										type:        "string"
									}
									runAsGroup: {
										description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext."
										format:      "int64"
										type:        "integer"
									}
									runAsNonRoot: {
										description: "Indicates that the container must run as a non-root user."
										type:        "boolean"
									}
									runAsUser: {
										description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext."
										format:      "int64"
										type:        "integer"
									}
									seLinuxOptions: {
										description: "The SELinux context to be applied to all containers. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in SecurityContext."
										properties: {
											level: {
												description: "Level is SELinux level label that applies to the container."
												type:        "string"
											}
											role: {
												description: "Role is a SELinux role label that applies to the container."
												type:        "string"
											}
											type: {
												description: "Type is a SELinux type label that applies to the container."
												type:        "string"
											}
											user: {
												description: "User is a SELinux user label that applies to the container."
												type:        "string"
											}
										}
										type: "object"
									}
									seccompProfile: {
										description: "The seccomp options to use by the containers in this pod. Note that this field cannot be set when spec.os.name is windows."
										properties: {
											localhostProfile: {
												description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
												type:        "string"
											}
											type: {
												description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
												type: "string"
											}
										}
										required: ["type"]
										type: "object"
									}
									supplementalGroups: {
										description: "A list of groups applied to the first process run in each container, in addition to the container's primary GID, the fsGroup (if specified), and group memberships defined in the container image for th"
										items: {
											format: "int64"
											type:   "integer"
										}
										type: "array"
									}
									sysctls: {
										description: "Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls (by the container runtime) might fail to launch. Note that this field cannot be set when spec.os."
										items: {
											description: "Sysctl defines a kernel parameter to be set"
											properties: {
												name: {
													description: "Name of a property to set"
													type:        "string"
												}
												value: {
													description: "Value of a property to set"
													type:        "string"
												}
											}
											required: [
												"name",
												"value",
											]
											type: "object"
										}
										type: "array"
									}
									windowsOptions: {
										description: "The Windows specific settings applied to all containers. If unspecified, the options within a container's SecurityContext will be used."
										properties: {
											gmsaCredentialSpec: {
												description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
												type:        "string"
											}
											gmsaCredentialSpecName: {
												description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
												type:        "string"
											}
											hostProcess: {
												description: "HostProcess determines if a container should be run as a 'Host Process' container."
												type:        "boolean"
											}
											runAsUserName: {
												description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
												type:        "string"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							ports: {
								description: "Ports allows a set of ports to be exposed by the underlying v1.Service. By default, the operator will attempt to infer the required ports by parsing the .Spec."
								items: {
									description: "ServicePort contains information on service's port."
									properties: {
										appProtocol: {
											description: "The application protocol for this port. This is used as a hint for implementations to offer richer behavior for protocols that they understand. This field follows standard Kubernetes label syntax."
											type:        "string"
										}
										name: {
											description: "The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names."
											type:        "string"
										}
										nodePort: {
											description: "The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system."
											format:      "int32"
											type:        "integer"
										}
										port: {
											description: "The port that will be exposed by this service."
											format:      "int32"
											type:        "integer"
										}
										protocol: {
											default:     "TCP"
											description: "The IP protocol for this port. Supports \"TCP\", \"UDP\", and \"SCTP\". Default is TCP."
											type:        "string"
										}
										targetPort: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											description:                  "Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME."
											"x-kubernetes-int-or-string": true
										}
									}
									required: ["port"]
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
							priorityClassName: {
								description: "If specified, indicates the pod's priority. If not specified, the pod priority will be default or zero if there is no default."
								type:        "string"
							}
							replicas: {
								description: "Replicas is the number of pod instances for the underlying OpenTelemetry Collector. Set this if your are not using autoscaling"
								format:      "int32"
								type:        "integer"
							}
							resources: {
								description: "Resources to set on the OpenTelemetry Collector pods."
								properties: {
									claims: {
										description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
										items: {
											description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
											properties: name: {
												description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
												type:        "string"
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
										"x-kubernetes-list-map-keys": ["name"]
										"x-kubernetes-list-type": "map"
									}
									limits: {
										additionalProperties: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											"x-kubernetes-int-or-string": true
										}
										description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
										type:        "object"
									}
									requests: {
										additionalProperties: {
											anyOf: [{
												type: "integer"
											}, {
												type: "string"
											}]
											pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
											"x-kubernetes-int-or-string": true
										}
										description: "Requests describes the minimum amount of compute resources required."
										type:        "object"
									}
								}
								type: "object"
							}
							securityContext: {
								description: "SecurityContext configures the container security context for the opentelemetry-collector container."
								properties: {
									allowPrivilegeEscalation: {
										description: "AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process."
										type:        "boolean"
									}
									capabilities: {
										description: "The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime. Note that this field cannot be set when spec.os.name is windows."
										properties: {
											add: {
												description: "Added capabilities"
												items: {
													description: "Capability represent POSIX capabilities type"
													type:        "string"
												}
												type: "array"
											}
											drop: {
												description: "Removed capabilities"
												items: {
													description: "Capability represent POSIX capabilities type"
													type:        "string"
												}
												type: "array"
											}
										}
										type: "object"
									}
									privileged: {
										description: "Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows."
										type:        "boolean"
									}
									procMount: {
										description: "procMount denotes the type of proc mount to use for the containers. The default is DefaultProcMount which uses the container runtime defaults for readonly paths and masked paths."
										type:        "string"
									}
									readOnlyRootFilesystem: {
										description: "Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows."
										type:        "boolean"
									}
									runAsGroup: {
										description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext."
										format:      "int64"
										type:        "integer"
									}
									runAsNonRoot: {
										description: "Indicates that the container must run as a non-root user."
										type:        "boolean"
									}
									runAsUser: {
										description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext."
										format:      "int64"
										type:        "integer"
									}
									seLinuxOptions: {
										description: "The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext."
										properties: {
											level: {
												description: "Level is SELinux level label that applies to the container."
												type:        "string"
											}
											role: {
												description: "Role is a SELinux role label that applies to the container."
												type:        "string"
											}
											type: {
												description: "Type is a SELinux type label that applies to the container."
												type:        "string"
											}
											user: {
												description: "User is a SELinux user label that applies to the container."
												type:        "string"
											}
										}
										type: "object"
									}
									seccompProfile: {
										description: "The seccomp options to use by this container. If seccomp options are provided at both the pod & container level, the container options override the pod options."
										properties: {
											localhostProfile: {
												description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
												type:        "string"
											}
											type: {
												description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
												type: "string"
											}
										}
										required: ["type"]
										type: "object"
									}
									windowsOptions: {
										description: "The Windows specific settings applied to all containers. If unspecified, the options from the PodSecurityContext will be used."
										properties: {
											gmsaCredentialSpec: {
												description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
												type:        "string"
											}
											gmsaCredentialSpecName: {
												description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
												type:        "string"
											}
											hostProcess: {
												description: "HostProcess determines if a container should be run as a 'Host Process' container."
												type:        "boolean"
											}
											runAsUserName: {
												description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
												type:        "string"
											}
										}
										type: "object"
									}
								}
								type: "object"
							}
							serviceAccount: {
								description: "ServiceAccount indicates the name of an existing service account to use with this instance. When set, the operator will not automatically create a ServiceAccount for the collector."
								type:        "string"
							}
							shareProcessNamespace: {
								description: "ShareProcessNamespace indicates if the pod's containers should share process namespace."
								type:        "boolean"
							}
							targetAllocator: {
								description: "TargetAllocator indicates a value which determines whether to spawn a target allocation resource or not."
								properties: {
									affinity: {
										description: "If specified, indicates the pod's scheduling constraints"
										properties: {
											nodeAffinity: {
												description: "Describes node affinity scheduling rules for the pod."
												properties: {
													preferredDuringSchedulingIgnoredDuringExecution: {
														description: "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
														items: {
															description: "An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op)."
															properties: {
																preference: {
																	description: "A node selector term, associated with the corresponding weight."
																	properties: {
																		matchExpressions: {
																			description: "A list of node selector requirements by node's labels."
																			items: {
																				description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "The label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																						type:        "string"
																					}
																					values: {
																						description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchFields: {
																			description: "A list of node selector requirements by node's fields."
																			items: {
																				description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "The label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																						type:        "string"
																					}
																					values: {
																						description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																weight: {
																	description: "Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100."
																	format:      "int32"
																	type:        "integer"
																}
															}
															required: [
																"preference",
																"weight",
															]
															type: "object"
														}
														type: "array"
													}
													requiredDuringSchedulingIgnoredDuringExecution: {
														description: "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
														properties: nodeSelectorTerms: {
															description: "Required. A list of node selector terms. The terms are ORed."
															items: {
																description: "A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm."
																properties: {
																	matchExpressions: {
																		description: "A list of node selector requirements by node's labels."
																		items: {
																			description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																			properties: {
																				key: {
																					description: "The label key that the selector applies to."
																					type:        "string"
																				}
																				operator: {
																					description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																					type:        "string"
																				}
																				values: {
																					description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																					items: type: "string"
																					type: "array"
																				}
																			}
																			required: [
																				"key",
																				"operator",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	matchFields: {
																		description: "A list of node selector requirements by node's fields."
																		items: {
																			description: "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																			properties: {
																				key: {
																					description: "The label key that the selector applies to."
																					type:        "string"
																				}
																				operator: {
																					description: "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
																					type:        "string"
																				}
																				values: {
																					description: "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																					items: type: "string"
																					type: "array"
																				}
																			}
																			required: [
																				"key",
																				"operator",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															type: "array"
														}
														required: ["nodeSelectorTerms"]
														type:                    "object"
														"x-kubernetes-map-type": "atomic"
													}
												}
												type: "object"
											}
											podAffinity: {
												description: "Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s))."
												properties: {
													preferredDuringSchedulingIgnoredDuringExecution: {
														description: "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
														items: {
															description: "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
															properties: {
																podAffinityTerm: {
																	description: "Required. A pod affinity term, associated with the corresponding weight."
																	properties: {
																		labelSelector: {
																			description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																			properties: {
																				matchExpressions: {
																					description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																					items: {
																						description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																						properties: {
																							key: {
																								description: "key is the label key that the selector applies to."
																								type:        "string"
																							}
																							operator: {
																								description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																								type:        "string"
																							}
																							values: {
																								description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																								items: type: "string"
																								type: "array"
																							}
																						}
																						required: [
																							"key",
																							"operator",
																						]
																						type: "object"
																					}
																					type: "array"
																				}
																				matchLabels: {
																					additionalProperties: type: "string"
																					description: "matchLabels is a map of {key,value} pairs."
																					type:        "object"
																				}
																			}
																			type:                    "object"
																			"x-kubernetes-map-type": "atomic"
																		}
																		matchLabelKeys: {
																			description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																			items: type: "string"
																			type:                     "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		mismatchLabelKeys: {
																			description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																			items: type: "string"
																			type:                     "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		namespaceSelector: {
																			description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																			properties: {
																				matchExpressions: {
																					description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																					items: {
																						description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																						properties: {
																							key: {
																								description: "key is the label key that the selector applies to."
																								type:        "string"
																							}
																							operator: {
																								description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																								type:        "string"
																							}
																							values: {
																								description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																								items: type: "string"
																								type: "array"
																							}
																						}
																						required: [
																							"key",
																							"operator",
																						]
																						type: "object"
																					}
																					type: "array"
																				}
																				matchLabels: {
																					additionalProperties: type: "string"
																					description: "matchLabels is a map of {key,value} pairs."
																					type:        "object"
																				}
																			}
																			type:                    "object"
																			"x-kubernetes-map-type": "atomic"
																		}
																		namespaces: {
																			description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																			items: type: "string"
																			type: "array"
																		}
																		topologyKey: {
																			description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																			type:        "string"
																		}
																	}
																	required: ["topologyKey"]
																	type: "object"
																}
																weight: {
																	description: "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
																	format:      "int32"
																	type:        "integer"
																}
															}
															required: [
																"podAffinityTerm",
																"weight",
															]
															type: "object"
														}
														type: "array"
													}
													requiredDuringSchedulingIgnoredDuringExecution: {
														description: "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
														items: {
															description: "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-locate"
															properties: {
																labelSelector: {
																	description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																matchLabelKeys: {
																	description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																mismatchLabelKeys: {
																	description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																namespaceSelector: {
																	description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																	items: type: "string"
																	type: "array"
																}
																topologyKey: {
																	description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																	type:        "string"
																}
															}
															required: ["topologyKey"]
															type: "object"
														}
														type: "array"
													}
												}
												type: "object"
											}
											podAntiAffinity: {
												description: "Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s))."
												properties: {
													preferredDuringSchedulingIgnoredDuringExecution: {
														description: "The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions."
														items: {
															description: "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
															properties: {
																podAffinityTerm: {
																	description: "Required. A pod affinity term, associated with the corresponding weight."
																	properties: {
																		labelSelector: {
																			description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																			properties: {
																				matchExpressions: {
																					description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																					items: {
																						description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																						properties: {
																							key: {
																								description: "key is the label key that the selector applies to."
																								type:        "string"
																							}
																							operator: {
																								description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																								type:        "string"
																							}
																							values: {
																								description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																								items: type: "string"
																								type: "array"
																							}
																						}
																						required: [
																							"key",
																							"operator",
																						]
																						type: "object"
																					}
																					type: "array"
																				}
																				matchLabels: {
																					additionalProperties: type: "string"
																					description: "matchLabels is a map of {key,value} pairs."
																					type:        "object"
																				}
																			}
																			type:                    "object"
																			"x-kubernetes-map-type": "atomic"
																		}
																		matchLabelKeys: {
																			description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																			items: type: "string"
																			type:                     "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		mismatchLabelKeys: {
																			description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																			items: type: "string"
																			type:                     "array"
																			"x-kubernetes-list-type": "atomic"
																		}
																		namespaceSelector: {
																			description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																			properties: {
																				matchExpressions: {
																					description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																					items: {
																						description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																						properties: {
																							key: {
																								description: "key is the label key that the selector applies to."
																								type:        "string"
																							}
																							operator: {
																								description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																								type:        "string"
																							}
																							values: {
																								description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																								items: type: "string"
																								type: "array"
																							}
																						}
																						required: [
																							"key",
																							"operator",
																						]
																						type: "object"
																					}
																					type: "array"
																				}
																				matchLabels: {
																					additionalProperties: type: "string"
																					description: "matchLabels is a map of {key,value} pairs."
																					type:        "object"
																				}
																			}
																			type:                    "object"
																			"x-kubernetes-map-type": "atomic"
																		}
																		namespaces: {
																			description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																			items: type: "string"
																			type: "array"
																		}
																		topologyKey: {
																			description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																			type:        "string"
																		}
																	}
																	required: ["topologyKey"]
																	type: "object"
																}
																weight: {
																	description: "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
																	format:      "int32"
																	type:        "integer"
																}
															}
															required: [
																"podAffinityTerm",
																"weight",
															]
															type: "object"
														}
														type: "array"
													}
													requiredDuringSchedulingIgnoredDuringExecution: {
														description: "If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node."
														items: {
															description: "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-locate"
															properties: {
																labelSelector: {
																	description: "A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																matchLabelKeys: {
																	description: "MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																mismatchLabelKeys: {
																	description: "MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration."
																	items: type: "string"
																	type:                     "array"
																	"x-kubernetes-list-type": "atomic"
																}
																namespaceSelector: {
																	description: "A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field."
																	properties: {
																		matchExpressions: {
																			description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																			items: {
																				description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																				properties: {
																					key: {
																						description: "key is the label key that the selector applies to."
																						type:        "string"
																					}
																					operator: {
																						description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																						type:        "string"
																					}
																					values: {
																						description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																						items: type: "string"
																						type: "array"
																					}
																				}
																				required: [
																					"key",
																					"operator",
																				]
																				type: "object"
																			}
																			type: "array"
																		}
																		matchLabels: {
																			additionalProperties: type: "string"
																			description: "matchLabels is a map of {key,value} pairs."
																			type:        "object"
																		}
																	}
																	type:                    "object"
																	"x-kubernetes-map-type": "atomic"
																}
																namespaces: {
																	description: "namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector."
																	items: type: "string"
																	type: "array"
																}
																topologyKey: {
																	description: "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose "
																	type:        "string"
																}
															}
															required: ["topologyKey"]
															type: "object"
														}
														type: "array"
													}
												}
												type: "object"
											}
										}
										type: "object"
									}
									allocationStrategy: {
										default:     "consistent-hashing"
										description: "AllocationStrategy determines which strategy the target allocator should use for allocation. The current options are least-weighted, consistent-hashing and per-node. The default is consistent-hashing."
										enum: [
											"least-weighted",
											"consistent-hashing",
											"per-node",
										]
										type: "string"
									}
									enabled: {
										description: "Enabled indicates whether to use a target allocation mechanism for Prometheus targets or not."
										type:        "boolean"
									}
									env: {
										description: "ENV vars to set on the OpenTelemetry TargetAllocator's Pods. These can then in certain cases be consumed in the config file for the TargetAllocator."
										items: {
											description: "EnvVar represents an environment variable present in a Container."
											properties: {
												name: {
													description: "Name of the environment variable. Must be a C_IDENTIFIER."
													type:        "string"
												}
												value: {
													description: "Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables."
													type:        "string"
												}
												valueFrom: {
													description: "Source for the environment variable's value. Cannot be used if value is not empty."
													properties: {
														configMapKeyRef: {
															description: "Selects a key of a ConfigMap."
															properties: {
																key: {
																	description: "The key to select."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the ConfigMap or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														fieldRef: {
															description: "Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status."
															properties: {
																apiVersion: {
																	description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																	type:        "string"
																}
																fieldPath: {
																	description: "Path of the field to select in the specified API version."
																	type:        "string"
																}
															}
															required: ["fieldPath"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														resourceFieldRef: {
															description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests."
															properties: {
																containerName: {
																	description: "Container name: required for volumes, optional for env vars"
																	type:        "string"
																}
																divisor: {
																	anyOf: [{
																		type: "integer"
																	}, {
																		type: "string"
																	}]
																	description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																	pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																	"x-kubernetes-int-or-string": true
																}
																resource: {
																	description: "Required: resource to select"
																	type:        "string"
																}
															}
															required: ["resource"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
														secretKeyRef: {
															description: "Selects a key of a secret in the pod's namespace"
															properties: {
																key: {
																	description: "The key of the secret to select from.  Must be a valid secret key."
																	type:        "string"
																}
																name: {
																	description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																	type:        "string"
																}
																optional: {
																	description: "Specify whether the Secret or its key must be defined"
																	type:        "boolean"
																}
															}
															required: ["key"]
															type:                    "object"
															"x-kubernetes-map-type": "atomic"
														}
													}
													type: "object"
												}
											}
											required: ["name"]
											type: "object"
										}
										type: "array"
									}
									filterStrategy: {
										default:     "relabel-config"
										description: "FilterStrategy determines how to filter targets before allocating them among the collectors. The only current option is relabel-config (drops targets based on prom relabel_config)."
										type:        "string"
									}
									image: {
										description: "Image indicates the container image to use for the OpenTelemetry TargetAllocator."
										type:        "string"
									}
									nodeSelector: {
										additionalProperties: type: "string"
										description: "NodeSelector to schedule OpenTelemetry TargetAllocator pods."
										type:        "object"
									}
									observability: {
										description: "ObservabilitySpec defines how telemetry data gets handled."
										properties: metrics: {
											description: "Metrics defines the metrics configuration for operands."
											properties: {
												DisablePrometheusAnnotations: {
													description: "DisablePrometheusAnnotations controls the automatic addition of default Prometheus annotations ('prometheus.io/scrape', 'prometheus.io/port', and 'prometheus.io/path')"
													type:        "boolean"
												}
												enableMetrics: {
													description: "EnableMetrics specifies if ServiceMonitor or PodMonitor(for sidecar mode) should be created for the service managed by the OpenTelemetry Operator. The operator.observability."
													type:        "boolean"
												}
											}
											type: "object"
										}
										type: "object"
									}
									podDisruptionBudget: {
										description: "PodDisruptionBudget specifies the pod disruption budget configuration to use for the target allocator workload."
										properties: {
											maxUnavailable: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												description:                  "An eviction is allowed if at most \"maxUnavailable\" pods selected by \"selector\" are unavailable after the eviction, i.e. even in absence of the evicted pod."
												"x-kubernetes-int-or-string": true
											}
											minAvailable: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												description:                  "An eviction is allowed if at least \"minAvailable\" pods selected by \"selector\" will still be available after the eviction, i.e. even in the absence of the evicted pod."
												"x-kubernetes-int-or-string": true
											}
										}
										type: "object"
									}
									podSecurityContext: {
										description: "PodSecurityContext configures the pod security context for the targetallocator."
										properties: {
											fsGroup: {
												description: """
		A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod: 
		 1.
		"""
												format: "int64"
												type:   "integer"
											}
											fsGroupChangePolicy: {
												description: "fsGroupChangePolicy defines behavior of changing ownership and permission of the volume before being exposed inside Pod."
												type:        "string"
											}
											runAsGroup: {
												description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext."
												format:      "int64"
												type:        "integer"
											}
											runAsNonRoot: {
												description: "Indicates that the container must run as a non-root user."
												type:        "boolean"
											}
											runAsUser: {
												description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext."
												format:      "int64"
												type:        "integer"
											}
											seLinuxOptions: {
												description: "The SELinux context to be applied to all containers. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in SecurityContext."
												properties: {
													level: {
														description: "Level is SELinux level label that applies to the container."
														type:        "string"
													}
													role: {
														description: "Role is a SELinux role label that applies to the container."
														type:        "string"
													}
													type: {
														description: "Type is a SELinux type label that applies to the container."
														type:        "string"
													}
													user: {
														description: "User is a SELinux user label that applies to the container."
														type:        "string"
													}
												}
												type: "object"
											}
											seccompProfile: {
												description: "The seccomp options to use by the containers in this pod. Note that this field cannot be set when spec.os.name is windows."
												properties: {
													localhostProfile: {
														description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
														type:        "string"
													}
													type: {
														description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
														type: "string"
													}
												}
												required: ["type"]
												type: "object"
											}
											supplementalGroups: {
												description: "A list of groups applied to the first process run in each container, in addition to the container's primary GID, the fsGroup (if specified), and group memberships defined in the container image for th"
												items: {
													format: "int64"
													type:   "integer"
												}
												type: "array"
											}
											sysctls: {
												description: "Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls (by the container runtime) might fail to launch. Note that this field cannot be set when spec.os."
												items: {
													description: "Sysctl defines a kernel parameter to be set"
													properties: {
														name: {
															description: "Name of a property to set"
															type:        "string"
														}
														value: {
															description: "Value of a property to set"
															type:        "string"
														}
													}
													required: [
														"name",
														"value",
													]
													type: "object"
												}
												type: "array"
											}
											windowsOptions: {
												description: "The Windows specific settings applied to all containers. If unspecified, the options within a container's SecurityContext will be used."
												properties: {
													gmsaCredentialSpec: {
														description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
														type:        "string"
													}
													gmsaCredentialSpecName: {
														description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
														type:        "string"
													}
													hostProcess: {
														description: "HostProcess determines if a container should be run as a 'Host Process' container."
														type:        "boolean"
													}
													runAsUserName: {
														description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
														type:        "string"
													}
												}
												type: "object"
											}
										}
										type: "object"
									}
									prometheusCR: {
										description: "PrometheusCR defines the configuration for the retrieval of PrometheusOperator CRDs ( servicemonitor.monitoring.coreos.com/v1 and podmonitor.monitoring.coreos.com/v1 )  retrieval."
										properties: {
											enabled: {
												description: "Enabled indicates whether to use a PrometheusOperator custom resources as targets or not."
												type:        "boolean"
											}
											podMonitorSelector: {
												additionalProperties: type: "string"
												description: "PodMonitors to be selected for target discovery. This is a map of {key,value} pairs. Each {key,value} in the map is going to exactly match a label in a PodMonitor's meta labels."
												type:        "object"
											}
											scrapeInterval: {
												default: "30s"
												description: """
		Interval between consecutive scrapes. Equivalent to the same setting on the Prometheus CRD. 
		 Default: \"30s\"
		"""
												format: "duration"
												type:   "string"
											}
											serviceMonitorSelector: {
												additionalProperties: type: "string"
												description: "ServiceMonitors to be selected for target discovery. This is a map of {key,value} pairs. Each {key,value} in the map is going to exactly match a label in a ServiceMonitor's meta labels."
												type:        "object"
											}
										}
										type: "object"
									}
									replicas: {
										description: "Replicas is the number of pod instances for the underlying TargetAllocator. This should only be set to a value other than 1 if a strategy that allows for high availability is chosen."
										format:      "int32"
										type:        "integer"
									}
									resources: {
										description: "Resources to set on the OpenTelemetryTargetAllocator containers."
										properties: {
											claims: {
												description: """
		Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container. 
		 This is an alpha field and requires enabling the DynamicResourceAllocation feature gate.
		"""
												items: {
													description: "ResourceClaim references one entry in PodSpec.ResourceClaims."
													properties: name: {
														description: "Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container."
														type:        "string"
													}
													required: ["name"]
													type: "object"
												}
												type: "array"
												"x-kubernetes-list-map-keys": ["name"]
												"x-kubernetes-list-type": "map"
											}
											limits: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
												type:        "object"
											}
											requests: {
												additionalProperties: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
												description: "Requests describes the minimum amount of compute resources required."
												type:        "object"
											}
										}
										type: "object"
									}
									securityContext: {
										description: "SecurityContext configures the container security context for the targetallocator."
										properties: {
											allowPrivilegeEscalation: {
												description: "AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process."
												type:        "boolean"
											}
											capabilities: {
												description: "The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime. Note that this field cannot be set when spec.os.name is windows."
												properties: {
													add: {
														description: "Added capabilities"
														items: {
															description: "Capability represent POSIX capabilities type"
															type:        "string"
														}
														type: "array"
													}
													drop: {
														description: "Removed capabilities"
														items: {
															description: "Capability represent POSIX capabilities type"
															type:        "string"
														}
														type: "array"
													}
												}
												type: "object"
											}
											privileged: {
												description: "Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows."
												type:        "boolean"
											}
											procMount: {
												description: "procMount denotes the type of proc mount to use for the containers. The default is DefaultProcMount which uses the container runtime defaults for readonly paths and masked paths."
												type:        "string"
											}
											readOnlyRootFilesystem: {
												description: "Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows."
												type:        "boolean"
											}
											runAsGroup: {
												description: "The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext."
												format:      "int64"
												type:        "integer"
											}
											runAsNonRoot: {
												description: "Indicates that the container must run as a non-root user."
												type:        "boolean"
											}
											runAsUser: {
												description: "The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext."
												format:      "int64"
												type:        "integer"
											}
											seLinuxOptions: {
												description: "The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext."
												properties: {
													level: {
														description: "Level is SELinux level label that applies to the container."
														type:        "string"
													}
													role: {
														description: "Role is a SELinux role label that applies to the container."
														type:        "string"
													}
													type: {
														description: "Type is a SELinux type label that applies to the container."
														type:        "string"
													}
													user: {
														description: "User is a SELinux user label that applies to the container."
														type:        "string"
													}
												}
												type: "object"
											}
											seccompProfile: {
												description: "The seccomp options to use by this container. If seccomp options are provided at both the pod & container level, the container options override the pod options."
												properties: {
													localhostProfile: {
														description: "localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work."
														type:        "string"
													}
													type: {
														description: """
		type indicates which kind of seccomp profile will be applied. Valid options are: 
		 Localhost - a profile defined in a file on the node should be used.
		"""
														type: "string"
													}
												}
												required: ["type"]
												type: "object"
											}
											windowsOptions: {
												description: "The Windows specific settings applied to all containers. If unspecified, the options from the PodSecurityContext will be used."
												properties: {
													gmsaCredentialSpec: {
														description: "GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field."
														type:        "string"
													}
													gmsaCredentialSpecName: {
														description: "GMSACredentialSpecName is the name of the GMSA credential spec to use."
														type:        "string"
													}
													hostProcess: {
														description: "HostProcess determines if a container should be run as a 'Host Process' container."
														type:        "boolean"
													}
													runAsUserName: {
														description: "The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext."
														type:        "string"
													}
												}
												type: "object"
											}
										}
										type: "object"
									}
									serviceAccount: {
										description: "ServiceAccount indicates the name of an existing service account to use with this instance. When set, the operator will not automatically create a ServiceAccount for the TargetAllocator."
										type:        "string"
									}
									tolerations: {
										description: "Toleration embedded kubernetes pod configuration option, controls how pods can be scheduled with matching taints"
										items: {
											description: "The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>."
											properties: {
												effect: {
													description: "Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute."
													type:        "string"
												}
												key: {
													description: "Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys."
													type:        "string"
												}
												operator: {
													description: "Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal."
													type:        "string"
												}
												tolerationSeconds: {
													description: "TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint."
													format:      "int64"
													type:        "integer"
												}
												value: {
													description: "Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string."
													type:        "string"
												}
											}
											type: "object"
										}
										type: "array"
									}
									topologySpreadConstraints: {
										description: "TopologySpreadConstraints embedded kubernetes pod configuration option, controls how pods are spread across your cluster among failure-domains such as regions, zones, nodes, and other user-defined top"
										items: {
											description: "TopologySpreadConstraint specifies how to spread matching pods among the given topology."
											properties: {
												labelSelector: {
													description: "LabelSelector is used to find matching pods. Pods that match this label selector are counted to determine the number of pods in their corresponding topology domain."
													properties: {
														matchExpressions: {
															description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
															items: {
																description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																properties: {
																	key: {
																		description: "key is the label key that the selector applies to."
																		type:        "string"
																	}
																	operator: {
																		description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																		type:        "string"
																	}
																	values: {
																		description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																		items: type: "string"
																		type: "array"
																	}
																}
																required: [
																	"key",
																	"operator",
																]
																type: "object"
															}
															type: "array"
														}
														matchLabels: {
															additionalProperties: type: "string"
															description: "matchLabels is a map of {key,value} pairs."
															type:        "object"
														}
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												matchLabelKeys: {
													description: "MatchLabelKeys is a set of pod label keys to select the pods over which spreading will be calculated."
													items: type: "string"
													type:                     "array"
													"x-kubernetes-list-type": "atomic"
												}
												maxSkew: {
													description: "MaxSkew describes the degree to which pods may be unevenly distributed."
													format:      "int32"
													type:        "integer"
												}
												minDomains: {
													description: "MinDomains indicates a minimum number of eligible domains."
													format:      "int32"
													type:        "integer"
												}
												nodeAffinityPolicy: {
													description: "NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when calculating pod topology spread skew."
													type:        "string"
												}
												nodeTaintsPolicy: {
													description: "NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology spread skew."
													type:        "string"
												}
												topologyKey: {
													description: "TopologyKey is the key of node labels. Nodes that have a label with this key and identical values are considered to be in the same topology."
													type:        "string"
												}
												whenUnsatisfiable: {
													description: "WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it."
													type:        "string"
												}
											}
											required: [
												"maxSkew",
												"topologyKey",
												"whenUnsatisfiable",
											]
											type: "object"
										}
										type: "array"
									}
								}
								type: "object"
							}
							terminationGracePeriodSeconds: {
								description: "Duration in seconds the pod needs to terminate gracefully upon probe failure."
								format:      "int64"
								type:        "integer"
							}
							tolerations: {
								description: "Toleration to schedule OpenTelemetry Collector pods. This is only relevant to daemonset, statefulset, and deployment mode"
								items: {
									description: "The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>."
									properties: {
										effect: {
											description: "Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute."
											type:        "string"
										}
										key: {
											description: "Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys."
											type:        "string"
										}
										operator: {
											description: "Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal."
											type:        "string"
										}
										tolerationSeconds: {
											description: "TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint."
											format:      "int64"
											type:        "integer"
										}
										value: {
											description: "Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string."
											type:        "string"
										}
									}
									type: "object"
								}
								type: "array"
							}
							topologySpreadConstraints: {
								description: "TopologySpreadConstraints embedded kubernetes pod configuration option, controls how pods are spread across your cluster among failure-domains such as regions, zones, nodes, and other user-defined top"
								items: {
									description: "TopologySpreadConstraint specifies how to spread matching pods among the given topology."
									properties: {
										labelSelector: {
											description: "LabelSelector is used to find matching pods. Pods that match this label selector are counted to determine the number of pods in their corresponding topology domain."
											properties: {
												matchExpressions: {
													description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
													items: {
														description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
														properties: {
															key: {
																description: "key is the label key that the selector applies to."
																type:        "string"
															}
															operator: {
																description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																type:        "string"
															}
															values: {
																description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																items: type: "string"
																type: "array"
															}
														}
														required: [
															"key",
															"operator",
														]
														type: "object"
													}
													type: "array"
												}
												matchLabels: {
													additionalProperties: type: "string"
													description: "matchLabels is a map of {key,value} pairs."
													type:        "object"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										matchLabelKeys: {
											description: "MatchLabelKeys is a set of pod label keys to select the pods over which spreading will be calculated."
											items: type: "string"
											type:                     "array"
											"x-kubernetes-list-type": "atomic"
										}
										maxSkew: {
											description: "MaxSkew describes the degree to which pods may be unevenly distributed."
											format:      "int32"
											type:        "integer"
										}
										minDomains: {
											description: "MinDomains indicates a minimum number of eligible domains."
											format:      "int32"
											type:        "integer"
										}
										nodeAffinityPolicy: {
											description: "NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when calculating pod topology spread skew."
											type:        "string"
										}
										nodeTaintsPolicy: {
											description: "NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology spread skew."
											type:        "string"
										}
										topologyKey: {
											description: "TopologyKey is the key of node labels. Nodes that have a label with this key and identical values are considered to be in the same topology."
											type:        "string"
										}
										whenUnsatisfiable: {
											description: "WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it."
											type:        "string"
										}
									}
									required: [
										"maxSkew",
										"topologyKey",
										"whenUnsatisfiable",
									]
									type: "object"
								}
								type: "array"
							}
							updateStrategy: {
								description: "UpdateStrategy represents the strategy the operator will take replacing existing DaemonSet pods with new pods https://kubernetes."
								properties: {
									rollingUpdate: {
										description: "Rolling update config params. Present only if type = \"RollingUpdate\". --- TODO: Update this to follow our convention for oneOf, whatever we decide it to be. Same as Deployment `strategy."
										properties: {
											maxSurge: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												description:                  "The maximum number of nodes with an existing available DaemonSet pod that can have an updated DaemonSet pod during during an update."
												"x-kubernetes-int-or-string": true
											}
											maxUnavailable: {
												anyOf: [{
													type: "integer"
												}, {
													type: "string"
												}]
												description:                  "The maximum number of DaemonSet pods that can be unavailable during the update."
												"x-kubernetes-int-or-string": true
											}
										}
										type: "object"
									}
									type: {
										description: "Type of daemon set update. Can be \"RollingUpdate\" or \"OnDelete\". Default is RollingUpdate."
										type:        "string"
									}
								}
								type: "object"
							}
							upgradeStrategy: {
								description: "UpgradeStrategy represents how the operator will handle upgrades to the CR when a newer version of the operator is deployed"
								enum: [
									"automatic",
									"none",
								]
								type: "string"
							}
							volumeClaimTemplates: {
								description: "VolumeClaimTemplates will provide stable storage using PersistentVolumes. Only available when the mode=statefulset."
								items: {
									description: "PersistentVolumeClaim is a user's request for and claim to a persistent volume"
									properties: {
										apiVersion: {
											description: "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values."
											type:        "string"
										}
										kind: {
											description: "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase."
											type:        "string"
										}
										metadata: {
											description: "Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata"
											properties: {
												annotations: {
													additionalProperties: type: "string"
													type: "object"
												}
												finalizers: {
													items: type: "string"
													type: "array"
												}
												labels: {
													additionalProperties: type: "string"
													type: "object"
												}
												name: type:      "string"
												namespace: type: "string"
											}
											type: "object"
										}
										spec: {
											description: "spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims"
											properties: {
												accessModes: {
													description: "accessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1"
													items: type: "string"
													type: "array"
												}
												dataSource: {
													description: "dataSource field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s."
													properties: {
														apiGroup: {
															description: "APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required."
															type:        "string"
														}
														kind: {
															description: "Kind is the type of resource being referenced"
															type:        "string"
														}
														name: {
															description: "Name is the name of resource being referenced"
															type:        "string"
														}
													}
													required: [
														"kind",
														"name",
													]
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												dataSourceRef: {
													description: "dataSourceRef specifies the object from which to populate the volume with data, if a non-empty volume is desired."
													properties: {
														apiGroup: {
															description: "APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required."
															type:        "string"
														}
														kind: {
															description: "Kind is the type of resource being referenced"
															type:        "string"
														}
														name: {
															description: "Name is the name of resource being referenced"
															type:        "string"
														}
														namespace: {
															description: "Namespace is the namespace of resource being referenced Note that when a namespace is specified, a gateway.networking.k8s."
															type:        "string"
														}
													}
													required: [
														"kind",
														"name",
													]
													type: "object"
												}
												resources: {
													description: "resources represents the minimum resources the volume should have."
													properties: {
														limits: {
															additionalProperties: {
																anyOf: [{
																	type: "integer"
																}, {
																	type: "string"
																}]
																pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																"x-kubernetes-int-or-string": true
															}
															description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
															type:        "object"
														}
														requests: {
															additionalProperties: {
																anyOf: [{
																	type: "integer"
																}, {
																	type: "string"
																}]
																pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																"x-kubernetes-int-or-string": true
															}
															description: "Requests describes the minimum amount of compute resources required."
															type:        "object"
														}
													}
													type: "object"
												}
												selector: {
													description: "selector is a label query over volumes to consider for binding."
													properties: {
														matchExpressions: {
															description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
															items: {
																description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																properties: {
																	key: {
																		description: "key is the label key that the selector applies to."
																		type:        "string"
																	}
																	operator: {
																		description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																		type:        "string"
																	}
																	values: {
																		description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																		items: type: "string"
																		type: "array"
																	}
																}
																required: [
																	"key",
																	"operator",
																]
																type: "object"
															}
															type: "array"
														}
														matchLabels: {
															additionalProperties: type: "string"
															description: "matchLabels is a map of {key,value} pairs."
															type:        "object"
														}
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												storageClassName: {
													description: "storageClassName is the name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1"
													type:        "string"
												}
												volumeAttributesClassName: {
													description: "volumeAttributesClassName may be used to set the VolumeAttributesClass used by this claim."
													type:        "string"
												}
												volumeMode: {
													description: "volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec."
													type:        "string"
												}
												volumeName: {
													description: "volumeName is the binding reference to the PersistentVolume backing this claim."
													type:        "string"
												}
											}
											type: "object"
										}
										status: {
											description: "status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims"
											properties: {
												accessModes: {
													description: "accessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1"
													items: type: "string"
													type: "array"
												}
												allocatedResourceStatuses: {
													additionalProperties: {
														description: "When a controller receives persistentvolume claim update with ClaimResourceStatus for a resource that it does not recognizes, then it should ignore that update and let other controllers handle it."
														type:        "string"
													}
													description:             "allocatedResourceStatuses stores status of resource being resized for the given PVC. Key names follow standard Kubernetes label syntax."
													type:                    "object"
													"x-kubernetes-map-type": "granular"
												}
												allocatedResources: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													description: "allocatedResources tracks the resources allocated to a PVC including its capacity. Key names follow standard Kubernetes label syntax."
													type:        "object"
												}
												capacity: {
													additionalProperties: {
														anyOf: [{
															type: "integer"
														}, {
															type: "string"
														}]
														pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
														"x-kubernetes-int-or-string": true
													}
													description: "capacity represents the actual resources of the underlying volume."
													type:        "object"
												}
												conditions: {
													description: "conditions is the current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'ResizeStarted'."
													items: {
														description: "PersistentVolumeClaimCondition contains details about state of pvc"
														properties: {
															lastProbeTime: {
																description: "lastProbeTime is the time we probed the condition."
																format:      "date-time"
																type:        "string"
															}
															lastTransitionTime: {
																description: "lastTransitionTime is the time the condition transitioned from one status to another."
																format:      "date-time"
																type:        "string"
															}
															message: {
																description: "message is the human-readable message indicating details about last transition."
																type:        "string"
															}
															reason: {
																description: "reason is a unique, this should be a short, machine understandable string that gives the reason for condition's last transition."
																type:        "string"
															}
															status: type: "string"
															type: {
																description: "PersistentVolumeClaimConditionType is a valid value of PersistentVolumeClaimCondition.Type"
																type:        "string"
															}
														}
														required: [
															"status",
															"type",
														]
														type: "object"
													}
													type: "array"
												}
												currentVolumeAttributesClassName: {
													description: "currentVolumeAttributesClassName is the current name of the VolumeAttributesClass the PVC is using."
													type:        "string"
												}
												modifyVolumeStatus: {
													description: "ModifyVolumeStatus represents the status object of ControllerModifyVolume operation. When this is unset, there is no ModifyVolume operation being attempted."
													properties: {
														status: {
															description: "status is the status of the ControllerModifyVolume operation."
															type:        "string"
														}
														targetVolumeAttributesClassName: {
															description: "targetVolumeAttributesClassName is the name of the VolumeAttributesClass the PVC currently being reconciled"
															type:        "string"
														}
													}
													required: ["status"]
													type: "object"
												}
												phase: {
													description: "phase represents the current phase of PersistentVolumeClaim."
													type:        "string"
												}
											}
											type: "object"
										}
									}
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
							volumeMounts: {
								description: "VolumeMounts represents the mount points to use in the underlying collector deployment(s)"
								items: {
									description: "VolumeMount describes a mounting of a Volume within a container."
									properties: {
										mountPath: {
											description: "Path within the container at which the volume should be mounted.  Must not contain ':'."
											type:        "string"
										}
										mountPropagation: {
											description: "mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationNone is used. This field is beta in 1.10."
											type:        "string"
										}
										name: {
											description: "This must match the Name of a Volume."
											type:        "string"
										}
										readOnly: {
											description: "Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false."
											type:        "boolean"
										}
										subPath: {
											description: "Path within the volume from which the container's volume should be mounted. Defaults to \"\" (volume's root)."
											type:        "string"
										}
										subPathExpr: {
											description: "Expanded path within the volume from which the container's volume should be mounted."
											type:        "string"
										}
									}
									required: [
										"mountPath",
										"name",
									]
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
							volumes: {
								description: "Volumes represents which volumes to use in the underlying collector deployment(s)."
								items: {
									description: "Volume represents a named volume in a pod that may be accessed by any container in the pod."
									properties: {
										awsElasticBlockStore: {
											description: "awsElasticBlockStore represents an AWS Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes."
											properties: {
												fsType: {
													description: "fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												partition: {
													description: "partition is the partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as \"1\"."
													format:      "int32"
													type:        "integer"
												}
												readOnly: {
													description: "readOnly value true will force the readOnly setting in VolumeMounts. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore"
													type:        "boolean"
												}
												volumeID: {
													description: "volumeID is unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore"
													type:        "string"
												}
											}
											required: ["volumeID"]
											type: "object"
										}
										azureDisk: {
											description: "azureDisk represents an Azure Data Disk mount on the host and bind mount to the pod."
											properties: {
												cachingMode: {
													description: "cachingMode is the Host Caching mode: None, Read Only, Read Write."
													type:        "string"
												}
												diskName: {
													description: "diskName is the Name of the data disk in the blob storage"
													type:        "string"
												}
												diskURI: {
													description: "diskURI is the URI of data disk in the blob storage"
													type:        "string"
												}
												fsType: {
													description: "fsType is Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												kind: {
													description: "kind expected values are Shared: multiple blob disks per storage account  Dedicated: single blob disk per storage account  Managed: azure managed data disk (only in managed availability set)."
													type:        "string"
												}
												readOnly: {
													description: "readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
											}
											required: [
												"diskName",
												"diskURI",
											]
											type: "object"
										}
										azureFile: {
											description: "azureFile represents an Azure File Service mount on the host and bind mount to the pod."
											properties: {
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretName: {
													description: "secretName is the  name of secret that contains Azure Storage Account Name and Key"
													type:        "string"
												}
												shareName: {
													description: "shareName is the azure share Name"
													type:        "string"
												}
											}
											required: [
												"secretName",
												"shareName",
											]
											type: "object"
										}
										cephfs: {
											description: "cephFS represents a Ceph FS mount on the host that shares a pod's lifetime"
											properties: {
												monitors: {
													description: "monitors is Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													items: type: "string"
													type: "array"
												}
												path: {
													description: "path is Optional: Used as the mounted root, rather than the full Ceph tree, default is /"
													type:        "string"
												}
												readOnly: {
													description: "readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													type:        "boolean"
												}
												secretFile: {
													description: "secretFile is Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													type:        "string"
												}
												secretRef: {
													description: "secretRef is Optional: SecretRef is reference to the authentication secret for User, default is empty. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												user: {
													description: "user is optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it"
													type:        "string"
												}
											}
											required: ["monitors"]
											type: "object"
										}
										cinder: {
											description: "cinder represents a cinder volume attached and mounted on kubelets host machine. More info: https://examples.k8s.io/mysql-cinder-pd/README.md"
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md"
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is optional: points to a secret object containing parameters used to connect to OpenStack."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												volumeID: {
													description: "volumeID used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md"
													type:        "string"
												}
											}
											required: ["volumeID"]
											type: "object"
										}
										configMap: {
											description: "configMap represents a configMap that should populate this volume"
											properties: {
												defaultMode: {
													description: "defaultMode is optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
													format:      "int32"
													type:        "integer"
												}
												items: {
													description: "items if unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value."
													items: {
														description: "Maps a string key to a path within a volume."
														properties: {
															key: {
																description: "key is the key to project."
																type:        "string"
															}
															mode: {
																description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																format:      "int32"
																type:        "integer"
															}
															path: {
																description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																type:        "string"
															}
														}
														required: [
															"key",
															"path",
														]
														type: "object"
													}
													type: "array"
												}
												name: {
													description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
													type:        "string"
												}
												optional: {
													description: "optional specify whether the ConfigMap or its keys must be defined"
													type:        "boolean"
												}
											}
											type:                    "object"
											"x-kubernetes-map-type": "atomic"
										}
										csi: {
											description: "csi (Container Storage Interface) represents ephemeral storage that is handled by certain external CSI drivers (Beta feature)."
											properties: {
												driver: {
													description: "driver is the name of the CSI driver that handles this volume. Consult with your admin for the correct name as registered in the cluster."
													type:        "string"
												}
												fsType: {
													description: "fsType to mount. Ex. \"ext4\", \"xfs\", \"ntfs\". If not provided, the empty value is passed to the associated CSI driver which will determine the default filesystem to apply."
													type:        "string"
												}
												nodePublishSecretRef: {
													description: "nodePublishSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI NodePublishVolume and NodeUnpublishVolume calls."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												readOnly: {
													description: "readOnly specifies a read-only configuration for the volume. Defaults to false (read/write)."
													type:        "boolean"
												}
												volumeAttributes: {
													additionalProperties: type: "string"
													description: "volumeAttributes stores driver-specific properties that are passed to the CSI driver. Consult your driver's documentation for supported values."
													type:        "object"
												}
											}
											required: ["driver"]
											type: "object"
										}
										downwardAPI: {
											description: "downwardAPI represents downward API about the pod that should populate this volume"
											properties: {
												defaultMode: {
													description: "Optional: mode bits to use on created files by default. Must be a Optional: mode bits used to set permissions on created files by default."
													format:      "int32"
													type:        "integer"
												}
												items: {
													description: "Items is a list of downward API volume file"
													items: {
														description: "DownwardAPIVolumeFile represents information to create the file containing the pod field"
														properties: {
															fieldRef: {
																description: "Required: Selects a field of the pod: only annotations, labels, name and namespace are supported."
																properties: {
																	apiVersion: {
																		description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																		type:        "string"
																	}
																	fieldPath: {
																		description: "Path of the field to select in the specified API version."
																		type:        "string"
																	}
																}
																required: ["fieldPath"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															mode: {
																description: "Optional: mode bits used to set permissions on this file, must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																format:      "int32"
																type:        "integer"
															}
															path: {
																description: "Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'"
																type:        "string"
															}
															resourceFieldRef: {
																description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported."
																properties: {
																	containerName: {
																		description: "Container name: required for volumes, optional for env vars"
																		type:        "string"
																	}
																	divisor: {
																		anyOf: [{
																			type: "integer"
																		}, {
																			type: "string"
																		}]
																		description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																		pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																		"x-kubernetes-int-or-string": true
																	}
																	resource: {
																		description: "Required: resource to select"
																		type:        "string"
																	}
																}
																required: ["resource"]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
														}
														required: ["path"]
														type: "object"
													}
													type: "array"
												}
											}
											type: "object"
										}
										emptyDir: {
											description: "emptyDir represents a temporary directory that shares a pod's lifetime. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir"
											properties: {
												medium: {
													description: "medium represents what type of storage medium should back this directory. The default is \"\" which means to use the node's default medium. Must be an empty string (default) or Memory."
													type:        "string"
												}
												sizeLimit: {
													anyOf: [{
														type: "integer"
													}, {
														type: "string"
													}]
													description:                  "sizeLimit is the total amount of local storage required for this EmptyDir volume. The size limit is also applicable for memory medium."
													pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
													"x-kubernetes-int-or-string": true
												}
											}
											type: "object"
										}
										ephemeral: {
											description: "ephemeral represents a volume that is handled by a cluster storage driver."
											properties: volumeClaimTemplate: {
												description: "Will be used to create a stand-alone PVC to provision the volume. The pod in which this EphemeralVolumeSource is embedded will be the owner of the PVC, i.e."
												properties: {
													metadata: {
														description: "May contain labels and annotations that will be copied into the PVC when creating it. No other fields are allowed and will be rejected during validation."
														properties: {
															annotations: {
																additionalProperties: type: "string"
																type: "object"
															}
															finalizers: {
																items: type: "string"
																type: "array"
															}
															labels: {
																additionalProperties: type: "string"
																type: "object"
															}
															name: type:      "string"
															namespace: type: "string"
														}
														type: "object"
													}
													spec: {
														description: "The specification for the PersistentVolumeClaim. The entire content is copied unchanged into the PVC that gets created from this template."
														properties: {
															accessModes: {
																description: "accessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1"
																items: type: "string"
																type: "array"
															}
															dataSource: {
																description: "dataSource field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s."
																properties: {
																	apiGroup: {
																		description: "APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required."
																		type:        "string"
																	}
																	kind: {
																		description: "Kind is the type of resource being referenced"
																		type:        "string"
																	}
																	name: {
																		description: "Name is the name of resource being referenced"
																		type:        "string"
																	}
																}
																required: [
																	"kind",
																	"name",
																]
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															dataSourceRef: {
																description: "dataSourceRef specifies the object from which to populate the volume with data, if a non-empty volume is desired."
																properties: {
																	apiGroup: {
																		description: "APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required."
																		type:        "string"
																	}
																	kind: {
																		description: "Kind is the type of resource being referenced"
																		type:        "string"
																	}
																	name: {
																		description: "Name is the name of resource being referenced"
																		type:        "string"
																	}
																	namespace: {
																		description: "Namespace is the namespace of resource being referenced Note that when a namespace is specified, a gateway.networking.k8s."
																		type:        "string"
																	}
																}
																required: [
																	"kind",
																	"name",
																]
																type: "object"
															}
															resources: {
																description: "resources represents the minimum resources the volume should have."
																properties: {
																	limits: {
																		additionalProperties: {
																			anyOf: [{
																				type: "integer"
																			}, {
																				type: "string"
																			}]
																			pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																			"x-kubernetes-int-or-string": true
																		}
																		description: "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/"
																		type:        "object"
																	}
																	requests: {
																		additionalProperties: {
																			anyOf: [{
																				type: "integer"
																			}, {
																				type: "string"
																			}]
																			pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																			"x-kubernetes-int-or-string": true
																		}
																		description: "Requests describes the minimum amount of compute resources required."
																		type:        "object"
																	}
																}
																type: "object"
															}
															selector: {
																description: "selector is a label query over volumes to consider for binding."
																properties: {
																	matchExpressions: {
																		description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																		items: {
																			description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																			properties: {
																				key: {
																					description: "key is the label key that the selector applies to."
																					type:        "string"
																				}
																				operator: {
																					description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																					type:        "string"
																				}
																				values: {
																					description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																					items: type: "string"
																					type: "array"
																				}
																			}
																			required: [
																				"key",
																				"operator",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	matchLabels: {
																		additionalProperties: type: "string"
																		description: "matchLabels is a map of {key,value} pairs."
																		type:        "object"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															storageClassName: {
																description: "storageClassName is the name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1"
																type:        "string"
															}
															volumeAttributesClassName: {
																description: "volumeAttributesClassName may be used to set the VolumeAttributesClass used by this claim."
																type:        "string"
															}
															volumeMode: {
																description: "volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec."
																type:        "string"
															}
															volumeName: {
																description: "volumeName is the binding reference to the PersistentVolume backing this claim."
																type:        "string"
															}
														}
														type: "object"
													}
												}
												required: ["spec"]
												type: "object"
											}
											type: "object"
										}
										fc: {
											description: "fc represents a Fibre Channel resource that is attached to a kubelet's host machine and then exposed to the pod."
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												lun: {
													description: "lun is Optional: FC target lun number"
													format:      "int32"
													type:        "integer"
												}
												readOnly: {
													description: "readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												targetWWNs: {
													description: "targetWWNs is Optional: FC target worldwide names (WWNs)"
													items: type: "string"
													type: "array"
												}
												wwids: {
													description: "wwids Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously."
													items: type: "string"
													type: "array"
												}
											}
											type: "object"
										}
										flexVolume: {
											description: "flexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin."
											properties: {
												driver: {
													description: "driver is the name of the driver to use for this volume."
													type:        "string"
												}
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". The default filesystem depends on FlexVolume script."
													type:        "string"
												}
												options: {
													additionalProperties: type: "string"
													description: "options is Optional: this field holds extra command options if any."
													type:        "object"
												}
												readOnly: {
													description: "readOnly is Optional: defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is Optional: secretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
											}
											required: ["driver"]
											type: "object"
										}
										flocker: {
											description: "flocker represents a Flocker volume attached to a kubelet's host machine. This depends on the Flocker control service being running"
											properties: {
												datasetName: {
													description: "datasetName is Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated"
													type:        "string"
												}
												datasetUUID: {
													description: "datasetUUID is the UUID of the dataset. This is unique identifier of a Flocker dataset"
													type:        "string"
												}
											}
											type: "object"
										}
										gcePersistentDisk: {
											description: "gcePersistentDisk represents a GCE Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes."
											properties: {
												fsType: {
													description: "fsType is filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												partition: {
													description: "partition is the partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as \"1\"."
													format:      "int32"
													type:        "integer"
												}
												pdName: {
													description: "pdName is unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk"
													type:        "boolean"
												}
											}
											required: ["pdName"]
											type: "object"
										}
										gitRepo: {
											description: "gitRepo represents a git repository at a particular revision. DEPRECATED: GitRepo is deprecated."
											properties: {
												directory: {
													description: "directory is the target directory name. Must not contain or start with '..'.  If '.' is supplied, the volume directory will be the git repository."
													type:        "string"
												}
												repository: {
													description: "repository is the URL"
													type:        "string"
												}
												revision: {
													description: "revision is the commit hash for the specified revision."
													type:        "string"
												}
											}
											required: ["repository"]
											type: "object"
										}
										glusterfs: {
											description: "glusterfs represents a Glusterfs mount on the host that shares a pod's lifetime. More info: https://examples.k8s.io/volumes/glusterfs/README.md"
											properties: {
												endpoints: {
													description: "endpoints is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod"
													type:        "string"
												}
												path: {
													description: "path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod"
													type:        "boolean"
												}
											}
											required: [
												"endpoints",
												"path",
											]
											type: "object"
										}
										hostPath: {
											description: "hostPath represents a pre-existing file or directory on the host machine that is directly exposed to the container."
											properties: {
												path: {
													description: "path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath"
													type:        "string"
												}
												type: {
													description: "type for HostPath Volume Defaults to \"\" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath"
													type:        "string"
												}
											}
											required: ["path"]
											type: "object"
										}
										iscsi: {
											description: "iscsi represents an ISCSI Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://examples.k8s.io/volumes/iscsi/README.md"
											properties: {
												chapAuthDiscovery: {
													description: "chapAuthDiscovery defines whether support iSCSI Discovery CHAP authentication"
													type:        "boolean"
												}
												chapAuthSession: {
													description: "chapAuthSession defines whether support iSCSI Session CHAP authentication"
													type:        "boolean"
												}
												fsType: {
													description: "fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												initiatorName: {
													description: "initiatorName is the custom iSCSI Initiator Name."
													type:        "string"
												}
												iqn: {
													description: "iqn is the target iSCSI Qualified Name."
													type:        "string"
												}
												iscsiInterface: {
													description: "iscsiInterface is the interface Name that uses an iSCSI transport. Defaults to 'default' (tcp)."
													type:        "string"
												}
												lun: {
													description: "lun represents iSCSI Target Lun number."
													format:      "int32"
													type:        "integer"
												}
												portals: {
													description: "portals is the iSCSI Target Portal List. The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260)."
													items: type: "string"
													type: "array"
												}
												readOnly: {
													description: "readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is the CHAP Secret for iSCSI target and initiator authentication"
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												targetPortal: {
													description: "targetPortal is iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260)."
													type:        "string"
												}
											}
											required: [
												"iqn",
												"lun",
												"targetPortal",
											]
											type: "object"
										}
										name: {
											description: "name of the volume. Must be a DNS_LABEL and unique within the pod. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names"
											type:        "string"
										}
										nfs: {
											description: "nfs represents an NFS mount on the host that shares a pod's lifetime More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
											properties: {
												path: {
													description: "path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
													type:        "boolean"
												}
												server: {
													description: "server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs"
													type:        "string"
												}
											}
											required: [
												"path",
												"server",
											]
											type: "object"
										}
										persistentVolumeClaim: {
											description: "persistentVolumeClaimVolumeSource represents a reference to a PersistentVolumeClaim in the same namespace. More info: https://kubernetes."
											properties: {
												claimName: {
													description: "claimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims"
													type:        "string"
												}
												readOnly: {
													description: "readOnly Will force the ReadOnly setting in VolumeMounts. Default false."
													type:        "boolean"
												}
											}
											required: ["claimName"]
											type: "object"
										}
										photonPersistentDisk: {
											description: "photonPersistentDisk represents a PhotonController persistent disk attached and mounted on kubelets host machine"
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												pdID: {
													description: "pdID is the ID that identifies Photon Controller persistent disk"
													type:        "string"
												}
											}
											required: ["pdID"]
											type: "object"
										}
										portworxVolume: {
											description: "portworxVolume represents a portworx volume attached and mounted on kubelets host machine"
											properties: {
												fsType: {
													description: "fSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												volumeID: {
													description: "volumeID uniquely identifies a Portworx volume"
													type:        "string"
												}
											}
											required: ["volumeID"]
											type: "object"
										}
										projected: {
											description: "projected items for all in one resources secrets, configmaps, and downward API"
											properties: {
												defaultMode: {
													description: "defaultMode are the mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
													format:      "int32"
													type:        "integer"
												}
												sources: {
													description: "sources is the list of volume projections"
													items: {
														description: "Projection that may be projected along with other supported volume types"
														properties: {
															clusterTrustBundle: {
																description: """
		ClusterTrustBundle allows a pod to access the `.spec.trustBundle` field of ClusterTrustBundle objects in an auto-updating file. 
		 Alpha, gated by the ClusterTrustBundleProjection feature gate.
		"""
																properties: {
																	labelSelector: {
																		description: "Select all ClusterTrustBundles that match this label selector.  Only has effect if signerName is set.  Mutually-exclusive with name.  If unset, interpreted as \"match nothing\"."
																		properties: {
																			matchExpressions: {
																				description: "matchExpressions is a list of label selector requirements. The requirements are ANDed."
																				items: {
																					description: "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
																					properties: {
																						key: {
																							description: "key is the label key that the selector applies to."
																							type:        "string"
																						}
																						operator: {
																							description: "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
																							type:        "string"
																						}
																						values: {
																							description: "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty."
																							items: type: "string"
																							type: "array"
																						}
																					}
																					required: [
																						"key",
																						"operator",
																					]
																					type: "object"
																				}
																				type: "array"
																			}
																			matchLabels: {
																				additionalProperties: type: "string"
																				description: "matchLabels is a map of {key,value} pairs."
																				type:        "object"
																			}
																		}
																		type:                    "object"
																		"x-kubernetes-map-type": "atomic"
																	}
																	name: {
																		description: "Select a single ClusterTrustBundle by object name.  Mutually-exclusive with signerName and labelSelector."
																		type:        "string"
																	}
																	optional: {
																		description: "If true, don't block pod startup if the referenced ClusterTrustBundle(s) aren't available.  If using name, then the named ClusterTrustBundle is allowed not to exist."
																		type:        "boolean"
																	}
																	path: {
																		description: "Relative path from the volume root to write the bundle."
																		type:        "string"
																	}
																	signerName: {
																		description: "Select all ClusterTrustBundles that match this signer name. Mutually-exclusive with name.  The contents of all selected ClusterTrustBundles will be unified and deduplicated."
																		type:        "string"
																	}
																}
																required: ["path"]
																type: "object"
															}
															configMap: {
																description: "configMap information about the configMap data to project"
																properties: {
																	items: {
																		description: "items if unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value."
																		items: {
																			description: "Maps a string key to a path within a volume."
																			properties: {
																				key: {
																					description: "key is the key to project."
																					type:        "string"
																				}
																				mode: {
																					description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																					format:      "int32"
																					type:        "integer"
																				}
																				path: {
																					description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																					type:        "string"
																				}
																			}
																			required: [
																				"key",
																				"path",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "optional specify whether the ConfigMap or its keys must be defined"
																		type:        "boolean"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															downwardAPI: {
																description: "downwardAPI information about the downwardAPI data to project"
																properties: items: {
																	description: "Items is a list of DownwardAPIVolume file"
																	items: {
																		description: "DownwardAPIVolumeFile represents information to create the file containing the pod field"
																		properties: {
																			fieldRef: {
																				description: "Required: Selects a field of the pod: only annotations, labels, name and namespace are supported."
																				properties: {
																					apiVersion: {
																						description: "Version of the schema the FieldPath is written in terms of, defaults to \"v1\"."
																						type:        "string"
																					}
																					fieldPath: {
																						description: "Path of the field to select in the specified API version."
																						type:        "string"
																					}
																				}
																				required: ["fieldPath"]
																				type:                    "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																			mode: {
																				description: "Optional: mode bits used to set permissions on this file, must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																				format:      "int32"
																				type:        "integer"
																			}
																			path: {
																				description: "Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'"
																				type:        "string"
																			}
																			resourceFieldRef: {
																				description: "Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported."
																				properties: {
																					containerName: {
																						description: "Container name: required for volumes, optional for env vars"
																						type:        "string"
																					}
																					divisor: {
																						anyOf: [{
																							type: "integer"
																						}, {
																							type: "string"
																						}]
																						description:                  "Specifies the output format of the exposed resources, defaults to \"1\""
																						pattern:                      "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
																						"x-kubernetes-int-or-string": true
																					}
																					resource: {
																						description: "Required: resource to select"
																						type:        "string"
																					}
																				}
																				required: ["resource"]
																				type:                    "object"
																				"x-kubernetes-map-type": "atomic"
																			}
																		}
																		required: ["path"]
																		type: "object"
																	}
																	type: "array"
																}
																type: "object"
															}
															secret: {
																description: "secret information about the secret data to project"
																properties: {
																	items: {
																		description: "items if unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value."
																		items: {
																			description: "Maps a string key to a path within a volume."
																			properties: {
																				key: {
																					description: "key is the key to project."
																					type:        "string"
																				}
																				mode: {
																					description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																					format:      "int32"
																					type:        "integer"
																				}
																				path: {
																					description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																					type:        "string"
																				}
																			}
																			required: [
																				"key",
																				"path",
																			]
																			type: "object"
																		}
																		type: "array"
																	}
																	name: {
																		description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
																		type:        "string"
																	}
																	optional: {
																		description: "optional field specify whether the Secret or its key must be defined"
																		type:        "boolean"
																	}
																}
																type:                    "object"
																"x-kubernetes-map-type": "atomic"
															}
															serviceAccountToken: {
																description: "serviceAccountToken is information about the serviceAccountToken data to project"
																properties: {
																	audience: {
																		description: "audience is the intended audience of the token. A recipient of a token must identify itself with an identifier specified in the audience of the token, and otherwise should reject the token."
																		type:        "string"
																	}
																	expirationSeconds: {
																		description: "expirationSeconds is the requested duration of validity of the service account token. As the token approaches expiration, the kubelet volume plugin will proactively rotate the service account token."
																		format:      "int64"
																		type:        "integer"
																	}
																	path: {
																		description: "path is the path relative to the mount point of the file to project the token into."
																		type:        "string"
																	}
																}
																required: ["path"]
																type: "object"
															}
														}
														type: "object"
													}
													type: "array"
												}
											}
											type: "object"
										}
										quobyte: {
											description: "quobyte represents a Quobyte mount on the host that shares a pod's lifetime"
											properties: {
												group: {
													description: "group to map volume access to Default is no group"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false."
													type:        "boolean"
												}
												registry: {
													description: "registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes"
													type:        "string"
												}
												tenant: {
													description: "tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin"
													type:        "string"
												}
												user: {
													description: "user to map volume access to Defaults to serivceaccount user"
													type:        "string"
												}
												volume: {
													description: "volume is a string that references an already created Quobyte volume by name."
													type:        "string"
												}
											}
											required: [
												"registry",
												"volume",
											]
											type: "object"
										}
										rbd: {
											description: "rbd represents a Rados Block Device mount on the host that shares a pod's lifetime. More info: https://examples.k8s.io/volumes/rbd/README.md"
											properties: {
												fsType: {
													description: "fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: \"ext4\", \"xfs\", \"ntfs\"."
													type:        "string"
												}
												image: {
													description: "image is the rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
												keyring: {
													description: "keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
												monitors: {
													description: "monitors is a collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													items: type: "string"
													type: "array"
												}
												pool: {
													description: "pool is the rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
												readOnly: {
													description: "readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef is name of the authentication secret for RBDUser. If provided overrides keyring. Default is nil. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												user: {
													description: "user is the rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it"
													type:        "string"
												}
											}
											required: [
												"image",
												"monitors",
											]
											type: "object"
										}
										scaleIO: {
											description: "scaleIO represents a ScaleIO persistent volume attached and mounted on Kubernetes nodes."
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Default is \"xfs\"."
													type:        "string"
												}
												gateway: {
													description: "gateway is the host address of the ScaleIO API Gateway."
													type:        "string"
												}
												protectionDomain: {
													description: "protectionDomain is the name of the ScaleIO Protection Domain for the configured storage."
													type:        "string"
												}
												readOnly: {
													description: "readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												sslEnabled: {
													description: "sslEnabled Flag enable/disable SSL communication with Gateway, default false"
													type:        "boolean"
												}
												storageMode: {
													description: "storageMode indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned."
													type:        "string"
												}
												storagePool: {
													description: "storagePool is the ScaleIO Storage Pool associated with the protection domain."
													type:        "string"
												}
												system: {
													description: "system is the name of the storage system as configured in ScaleIO."
													type:        "string"
												}
												volumeName: {
													description: "volumeName is the name of a volume already created in the ScaleIO system that is associated with this volume source."
													type:        "string"
												}
											}
											required: [
												"gateway",
												"secretRef",
												"system",
											]
											type: "object"
										}
										secret: {
											description: "secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret"
											properties: {
												defaultMode: {
													description: "defaultMode is Optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
													format:      "int32"
													type:        "integer"
												}
												items: {
													description: "items If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value."
													items: {
														description: "Maps a string key to a path within a volume."
														properties: {
															key: {
																description: "key is the key to project."
																type:        "string"
															}
															mode: {
																description: "mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511."
																format:      "int32"
																type:        "integer"
															}
															path: {
																description: "path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'."
																type:        "string"
															}
														}
														required: [
															"key",
															"path",
														]
														type: "object"
													}
													type: "array"
												}
												optional: {
													description: "optional field specify whether the Secret or its keys must be defined"
													type:        "boolean"
												}
												secretName: {
													description: "secretName is the name of the secret in the pod's namespace to use. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret"
													type:        "string"
												}
											}
											type: "object"
										}
										storageos: {
											description: "storageOS represents a StorageOS volume attached and mounted on Kubernetes nodes."
											properties: {
												fsType: {
													description: "fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												readOnly: {
													description: "readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts."
													type:        "boolean"
												}
												secretRef: {
													description: "secretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted."
													properties: name: {
														description: "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
														type:        "string"
													}
													type:                    "object"
													"x-kubernetes-map-type": "atomic"
												}
												volumeName: {
													description: "volumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace."
													type:        "string"
												}
												volumeNamespace: {
													description: "volumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used."
													type:        "string"
												}
											}
											type: "object"
										}
										vsphereVolume: {
											description: "vsphereVolume represents a vSphere volume attached and mounted on kubelets host machine"
											properties: {
												fsType: {
													description: "fsType is filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. \"ext4\", \"xfs\", \"ntfs\". Implicitly inferred to be \"ext4\" if unspecified."
													type:        "string"
												}
												storagePolicyID: {
													description: "storagePolicyID is the storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName."
													type:        "string"
												}
												storagePolicyName: {
													description: "storagePolicyName is the storage Policy Based Management (SPBM) profile name."
													type:        "string"
												}
												volumePath: {
													description: "volumePath is the path that identifies vSphere volume vmdk"
													type:        "string"
												}
											}
											required: ["volumePath"]
											type: "object"
										}
									}
									required: ["name"]
									type: "object"
								}
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
						}
						type: "object"
					}
					status: {
						description: "OpenTelemetryCollectorStatus defines the observed state of OpenTelemetryCollector."
						properties: {
							image: {
								description: "Image indicates the container image to use for the OpenTelemetry Collector."
								type:        "string"
							}
							messages: {
								description: "Messages about actions performed by the operator on this resource. Deprecated: use Kubernetes events instead."
								items: type: "string"
								type:                     "array"
								"x-kubernetes-list-type": "atomic"
							}
							replicas: {
								description: "Replicas is currently not being set and might be removed in the next version. Deprecated: use \"OpenTelemetryCollector.Status.Scale.Replicas\" instead."
								format:      "int32"
								type:        "integer"
							}
							scale: {
								description: "Scale is the OpenTelemetryCollector's scale subresource status."
								properties: {
									replicas: {
										description: "The total number non-terminated pods targeted by this OpenTelemetryCollector's deployment or statefulSet."
										format:      "int32"
										type:        "integer"
									}
									selector: {
										description: "The selector used to match the OpenTelemetryCollector's deployment or statefulSet pods."
										type:        "string"
									}
									statusReplicas: {
										description: "StatusReplicas is the number of pods targeted by this OpenTelemetryCollector's with a Ready Condition / Total number of non-terminated pods targeted by this OpenTelemetryCollector's (their labels matc"
										type:        "string"
									}
								}
								type: "object"
							}
							version: {
								description: "Version of the managed OpenTelemetry Collector (operand)"
								type:        "string"
							}
						}
						type: "object"
					}
				}
				type: "object"
			}
			served:  true
			storage: true
			subresources: {
				scale: {
					labelSelectorPath:  ".status.scale.selector"
					specReplicasPath:   ".spec.replicas"
					statusReplicasPath: ".status.scale.replicas"
				}
				status: {}
			}
		}]
	}
}
