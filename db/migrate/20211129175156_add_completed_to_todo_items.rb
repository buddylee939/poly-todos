class AddCompletedToTodoItems < ActiveRecord::Migration[6.1]
  def change
    add_column :todo_items, :completed, :boolean, default: false
  end
end
