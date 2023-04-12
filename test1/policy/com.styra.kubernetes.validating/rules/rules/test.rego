package policy["com.styra.kubernetes.validating"].rules.rules

monitor[decision] {
  parameters := {
    "prohibited_roles": {
      "testrole"
    }
  }

  data.library.v1.kubernetes.admission.rbac.v1.deny_clusterrolebinding_create_blacklist_rolename[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}
