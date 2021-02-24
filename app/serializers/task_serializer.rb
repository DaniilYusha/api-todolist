class TaskSerializer
  include JSONAPI::Serializer

  attributes :name, :is_done, :position
  belongs_to :project

  link(:self) { |object| Rails.application.routes.url_helpers.api_v1_task_path(object.id) }
end
