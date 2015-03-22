class AddNamesToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :firstname, :string
    add_column :employees, :lastname, :string
  end
end
