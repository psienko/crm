class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :pesel
      t.string :email
      t.string :phone_number
      t.string :city
      t.string :address
      t.string :postcode
      t.date :date_of_birth

      t.timestamps null: false
    end
  end
end
