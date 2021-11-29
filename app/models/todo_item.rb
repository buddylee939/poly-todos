class TodoItem < ApplicationRecord
  before_save :update_completed
  belongs_to :todo_list
  belongs_to :user

  private

  def update_completed
    if completed?
      self.completed_at = Time.now
    else
      self.completed_at = nil
    end
  end

end
