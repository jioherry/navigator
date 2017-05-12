class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change

  	add_column :users, :name, :string
  	add_column :users, :company, :string
  	add_column :users, :tel, :string
  	add_column :users, :address, :string
  	add_column :users, :fax, :string

  end
end
