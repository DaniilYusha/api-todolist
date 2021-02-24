class Task < ApplicationRecord
  belongs_to :project

  validates :name, uniqueness: true
end
