class CreateContractsProducts < ActiveRecord::Migration
  def change
    create_table :contracts_products, id: false do |t|
      t.references :contract, index: true
      t.references :product, index: true
    end
    add_foreign_key :contracts_products, :contracts
    add_foreign_key :contracts_products, :products
  end
end
