class AddItemUpdatedAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :item_updated_at, :datetime
  end
end
