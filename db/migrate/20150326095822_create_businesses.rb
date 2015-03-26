class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :industry
      t.string :email
      t.string :krs
      t.string :nip
      t.string :regon
      t.string :contacts

      t.timestamps null: false
    end
  end
end
