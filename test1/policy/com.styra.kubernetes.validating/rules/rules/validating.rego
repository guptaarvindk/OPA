package policy["com.styra.kubernetes.validating"].rules.rules

enforce[decision] {
  parameters := {
    "allowed_regions": {
      "us-west-2"
    }
  }

  data.global.libraries["crossplane-k8s"].restrict_s3_region[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.deny_privilege_escalation[message]
  decision := {
    "allowed": false,
    "message": message
  }
}
