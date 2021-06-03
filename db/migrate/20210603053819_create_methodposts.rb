class CreateMethodposts < ActiveRecord::Migration[6.1]
  def change
    create_table :methodposts do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.text :title
      t.string :subjects
      t.timestamps
    end
  end
end
