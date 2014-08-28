List = steroids.data.schema.json.toType {
  type: "object"
  properties:
    description:
      type: "string"
      required: true
    completed:
      type: "boolean"
    uid:
      type: "string"
}

# TODO: Change DB
ListResource = steroids.data.resources.builtio(
  applicationApiKey: 'blt349bf00642a3a1b7'
  applicationUid: 'steroids-data-test-app'
  name: 'task'
  schema: List
)

angular
  .module('ListModel', [])
  .constant('ListResource', ListResource)
