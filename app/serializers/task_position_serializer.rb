class TaskPositionSerializer
  include JSONAPI::Serializer

  set_type :positions

  attributes :position
end
