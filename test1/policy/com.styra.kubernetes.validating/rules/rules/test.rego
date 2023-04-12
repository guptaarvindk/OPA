package policy["com.styra.kubernetes.validating"].rules.rules

monitor[decision] {
  data.library.v1.kubernetes.admission.workload.v1.block_latest_image_tag[message]
  decision := {
    "allowed": false,
    "message": message
  }
}
