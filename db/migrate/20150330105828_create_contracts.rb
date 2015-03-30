class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contract_number
      t.text :content
      t.float :total_value
      t.float :additional_costs
      t.float :monthly_value
      t.references :customer, index: true
      t.datetime :date_of_signature
      t.datetime :date_of_start
      t.datetime :date_of_end

      t.timestamps null: false
    end
    add_foreign_key :contracts, :customers
  end
end
