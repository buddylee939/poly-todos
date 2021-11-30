class CreatePageCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :page_counts do |t|
      t.integer :count

      t.timestamps
    end
  end
end
