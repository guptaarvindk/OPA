package policy["com.styra.kubernetes.validating"].rules.rules
import future.keywords.in

monitor[decision] {
  parameters := {
    "min_period_seconds": 1
  }

  data.library.v1.kubernetes.admission.workload.v1.require_liveness_probe[message]
    with data.library.parameters as parameters

  decision := {
    "allowed": false,
    "message": message
  }
}
