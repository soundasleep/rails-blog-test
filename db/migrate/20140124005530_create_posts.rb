class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.boolean :allow_comments
      t.date :created_at

      t.timestamps
    end
  end
end
