class ProjectSerializer
  include JSONAPI::Serializer

  attributes :name
  has_many :tasks

  link(:self) { |object| Rails.application.routes.url_helpers.api_v1_project_path(object.id) }
end
