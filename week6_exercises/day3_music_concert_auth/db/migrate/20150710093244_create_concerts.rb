class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :band
      t.text :description
      t.string :venue
      t.string :city
      t.float :price
      t.datetime :date

      t.timestamps null: false
    end
  end
end
