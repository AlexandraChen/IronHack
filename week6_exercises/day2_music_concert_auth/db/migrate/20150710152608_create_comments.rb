class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :name
      t.integer :concert_id

      t.timestamps null: false
    end
  end
end
