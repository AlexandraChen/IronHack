class AddColumnToProducts < ActiveRecord::Migration
  def up
  	add_column :products, :user_id, :integer
  end
end
