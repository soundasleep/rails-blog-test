class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :openid_identity
      t.date :created_at
      t.string :name

      t.timestamps
    end
  end
end
