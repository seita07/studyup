class CreateCountdowns < ActiveRecord::Migration[6.1]
  def change
    create_table :countdowns do |t|
      t.integer :user_id
      t.string :omment
      t.datetime :event_day
      t.timestamps
    end
  end
end
