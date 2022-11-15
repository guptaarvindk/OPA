package policy["com.styra.kubernetes.mutating"].rules.rules




# code for setting CPU limits correctly based on the requested size in labels.
enforce[decision]{
  input.request.object.metadata.labels["size"] == "l"
  
  parameters := {
     "cpu_limit": "4"
  }
  data.library.v1.kubernetes.mutating.v1.add_default_cpu_limit[decision]
    with data.library.parameters as parameters
}

enforce[decision]{
  input.request.object.metadata.labels.size == "m"

  parameters := {
     "cpu_limit": "2"
  }
  data.library.v1.kubernetes.mutating.v1.add_default_cpu_limit[decision]
    with data.library.parameters as parameters
}

enforce[decision]{
not input.request.object.metadata.labels["size"] == "l"
not input.request.object.metadata.labels["size"] == "m"

  parameters := {
     "cpu_limit": "1"
  }
  data.library.v1.kubernetes.mutating.v1.add_default_cpu_limit[decision]
    with data.library.parameters as parameters
}
