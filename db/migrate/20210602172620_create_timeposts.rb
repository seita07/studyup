class CreateTimeposts < ActiveRecord::Migration[6.1]
  def change
    create_table :timeposts do |t|
      t.integer :user_id
      t.text :content
      t.integer :time
      t.string :subjects
      t.integer :minitus
      t.string :img
      t.integer :total_time
      t.datetime :datetime
      t.timestamps
    end
    add_index :timeposts, %i[user_id created_at]
  end
end
