class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customerable_id
      t.string :customerable_type
      t.timestamps null: false
    end
    add_index :customers, :customerable_id
  end
end
