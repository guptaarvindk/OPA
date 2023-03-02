package policy["com.styra.kubernetes.validating"].rules.rules
import future.keywords.in

enforce[decision] {
   
  #allowed_regions :=["us-west-2"]
  input.request.kind.group == "s3.aws.upbound.io"
  input.request.kind.kind == "Bucket"
  input.request.operation == "CREATE"
  #input.request.object.spec.forProvider.region in allowed_regions


  message := sprintf("Bucket region %s is not in allowed list", [input.request.object.spec.forProvider.region])

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
