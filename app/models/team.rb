class Team < ActiveRecord::Base
  has_many :employees
  has_many :customers
  has_one :message, as: :sender
  has_one :message, as: :recipient

  default_scope { order('team_name ASC') }

end
