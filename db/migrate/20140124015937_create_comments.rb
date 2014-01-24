class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :text
      t.date :created_at
      t.references :post, index: true

      t.timestamps
    end
  end
end
