class AddTeamIdToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :team, index: true
    add_foreign_key :customers, :teams
  end
end
