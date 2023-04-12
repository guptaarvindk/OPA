package policy["com.styra.kubernetes.validating"].rules.rules
import future.keywords.in


monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.deny_privilege_escalation[message]
  decision := {
    "allowed": false,
    "message": message
  }
}

monitor[decision] {
  parameters := {
    "prohibited_name_prefixes": {
      "system"
    }
  }

  data.library.v1.kubernetes.admission.rbac.v1.deny_role_name_blacklist_prefix[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}
