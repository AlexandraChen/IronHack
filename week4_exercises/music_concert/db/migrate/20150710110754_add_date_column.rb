class AddDateColumn < ActiveRecord::Migration
  def up
  	add_column :concerts, :date, :date
  end
end
