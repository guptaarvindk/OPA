package policy["com.styra.kubernetes.mutating"].rules.rules

enforce[decision] {
  parameters := {
    "labels": {
      "test": "m"
    }
  }


  data.library.v1.kubernetes.mutating.v1.add_missing_labels[decision]
    with data.library.parameters as parameters
}

monitor[decision] {
  parameters := {
    "labels_to_add": {
      "test"
    },
    "labels_to_override": {
      "override"
    }
  }

  data.library.v1.kubernetes.mutating.v1.inherit_namespace_labels[decision]
    with data.library.parameters as parameters
}

enforce[decision]{
  input.request.object.metdata.labels["size"] == "l"
  parameters := {
     "cpu_limit": "4"
  }
  data.library.v1.kubernetes.mutating.v1.add_default_cpu_limit[decision]
    with data.library.parameters as parameters
}
enforce[decision]{
  input.request.object.metdata.labels["size"] == "m"
  parameters := {
     "cpu_limit": "2"
  }
  data.library.v1.kubernetes.mutating.v1.add_default_cpu_limit[decision]
    with data.library.parameters as parameters
}

enforce[decision]{
  parameters := {
     "cpu_limit": "1"
  }
  data.library.v1.kubernetes.mutating.v1.add_default_cpu_limit[decision]
    with data.library.parameters as parameters
}
