class Chore < ApplicationRecord
  belongs_to :child, optional: false
  belongs_to :task, optional: false
  
  class << self
    def incomplete_chore_count
      Chore.incomplete.count
    end
  end

  scope :ordered, ->{ includes(:task).order('tasks.name') }
  scope :incomplete, ->{ where(complete: false) }
  scope :recent_and_incomplete, ->{ where(complete: false).or(where("created_at > ?", Time.now - 86400)).order(complete: :asc, created_at: :desc) }
  
  validates :task, uniqueness: { scope: :child_id, message: "has already been assigned to this child" }
end