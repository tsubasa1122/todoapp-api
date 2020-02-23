class Tag < ApplicationRecord
  has_many :task_tags
  validates :name, presence: true
end
