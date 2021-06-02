class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :occupation, :string
    add_column :users, :target_school, :string
    add_column :users, :comment, :text
    add_column :users, :image, :string
  end
end