package system.log

# The policy below instructs OPA to remove all data from secrets before uploading the decision
# https://www.openpolicyagent.org/docs/latest/decision-logs/#masking-sensitive-data

mask["/input/request/object/data"] {
  # The first input refers to the input to OPA and the rest is JSON pointers within the JSON.
  # There is input.input because the topmost field within the input JSON is called input.
  input.input.request.kind.kind == "Secret"
}

mask["/input/request/oldObject/data"] {
  input.input.request.kind.kind == "Secret"
}

mask["/input/request/object/metadata/annotations"] {
  input.input.request.kind.kind == "Secret"
}

mask["/input/request/oldObject/metadata/annotations"] {
  input.input.request.kind.kind == "Secret"
}

name := input.input.name
mask[{"op": "upsert", "path": "/result/outcome/system_type", "value": x}] {
    x := {"kind": input.result.outcome.system_type, "lable": "system1"}
}

# If there is sensitive information stored in ConfigMaps, you will also want to mask the relevant info.
# Here's an example of what that might look like for your deployment.
#
# mask["/input/request/object/metadata"] {
#   input.input.request.object.kind == "ConfigMap"
# }
#
# mask["/input/request/object/data"] {
#   input.input.request.object.kind == "ConfigMap"
# }
# mask["/input/request/oldObject/metadata"] {
#   input.input.request.oldObject.kind == "ConfigMap"
# }
#
# mask["/input/request/oldObject/data"] {
#   input.input.request.oldObject.kind == "ConfigMap"
# }
