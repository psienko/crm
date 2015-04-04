class AddAddressToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :phone_number, :string
    add_column :businesses, :city, :string
    add_column :businesses, :address, :string
    add_column :businesses, :postcode, :string
  end
end
