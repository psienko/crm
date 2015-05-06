class Team < ActiveRecord::Base
  has_many :employees
  has_many :customers
  has_many :sent_messages, as: :sender, class_name: 'Message'
  has_many :received_messages, as: :recipient, class_name: 'Message'

  default_scope { order('team_name ASC') }

end
