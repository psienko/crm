class AddTeamIdToEmployees < ActiveRecord::Migration
  def change
    add_reference :employees, :team, index: true
    add_foreign_key :employees, :teams
  end
end
