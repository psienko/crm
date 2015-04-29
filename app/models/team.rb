class Team < ActiveRecord::Base
  has_many :employees
  has_many :customers

  default_scope { order('team_name ASC') }
end
