class Team < ActiveRecord::Base
  has_many :employees
  has_many :customers
end
