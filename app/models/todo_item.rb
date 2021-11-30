class TodoItem < ApplicationRecord
  before_save :update_completed
  belongs_to :todo_list
  belongs_to :user
  validates :task, :notes, presence: true
  scope :completed, -> {where(completed: true)}
  
  private

  def update_completed
    if completed?
      self.completed_at = Time.now
    else
      self.completed_at = nil
    end
  end

end
