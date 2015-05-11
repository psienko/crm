class Message < ActiveRecord::Base
  belongs_to :recipient, polymorphic: true
  belongs_to :sender, polymorphic: true
  
  default_scope { order('date DESC') }

  def self.all_to(employee)
    Message.where(recipient: employee)
  end

  def self.all_to_team(employee)
    Message.where(recipient: employee.team)
  end

  def self.all_from(employee)
    Message.where(sender: employee)
  end

  def self.all_from_team(team)
    Message.where(sender: team)
  end

end
