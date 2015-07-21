class PhoneString < ActiveRecord::Migration
  def change
  	remove_column :contacts, :phone1
  	remove_column :contacts, :phone2

  	add_column :contacts, :phone1, :string
  	add_column :contacts, :phone2, :string
  end


end
