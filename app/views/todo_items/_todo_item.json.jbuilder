json.extract! todo_item, :id, :task, :notes, :response, :completed_at, :todo_list_id, :user_id, :created_at, :updated_at
json.url todo_item_url(todo_item, format: :json)
