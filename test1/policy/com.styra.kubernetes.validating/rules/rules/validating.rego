package policy["com.styra.kubernetes.validating"].rules.rules
enforce[decision] {
  data.library.v1.kubernetes.admission.metadata.v1.pod_fails_to_match_exactly_one_label[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

enforce[decision] {
  data.library.v1.kubernetes.admission.workload.v1.deny_privilege_escalation[message]
  decision := {
    "allowed": false,
    "message": message
  }
}
