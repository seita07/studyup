class CreateStudytimes < ActiveRecord::Migration[6.1]
  def change
    create_table :studytimes do |t|
      t.integer "user_id"
      t.integer "studytime"
      t.timestamps
    end
  end
end