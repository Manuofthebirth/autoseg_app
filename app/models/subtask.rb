class Subtask < ApplicationRecord
  belongs_to :task
  validates :title, presence: true

  def completed?
    !completed_at.blank?
  end
end
