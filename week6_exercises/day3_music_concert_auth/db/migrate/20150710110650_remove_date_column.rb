class RemoveDateColumn < ActiveRecord::Migration
  def up
  	remove_column :concerts, :date
  end
end
