class Task < ApplicationRecord
  belongs_to :user
  has_many :task_tags
  has_many :tags, through: :task_tags, source: :tag

  scope :incomplete, -> { where(completion_flg: false).order(id: "DESC") }
end
