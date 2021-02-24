class TaskCompleteSerializer
  include JSONAPI::Serializer
  
  attributes :name, :is_done, :position
end
