class EmailReceiver
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def self.call(email)
    new(email).call
  end

  def call
    sender = check_and_get_sender
    return false unless sender.present?
    recipients = check_and_get_recipient_for(sender)
    return false unless recipients.present?
    MessageCreator.call(email, sender, recipients)
  end

  private

  def check_and_get_sender
    sender = Customer.find_by_email(email.from[:email])
    sender = Employee.find_by(email: email.from[:email]) unless sender.present?
    notify_rejection(:no_customer) unless sender.present?
    sender
  end

  def check_and_get_recipient_for(sender)
    if sender.class.name == 'Employee'
      recipients = []
      recipients += Employee.where(email: email.to.map { |v| v[:email] })
      recipients += Team.where(team_name: email.to.map { |v| v[:token] })
      recipients = recipients.compact
      notify_rejection(:incorrect_recipient) if recipients.empty?
      return recipients
    end
    recipients_list = email.to.map { |v| v[:token] }
    teams = Team.where(team_name: recipients_list)
    correct_teams = teams.select { |val| val == sender.team }
    notify_rejection(:incorrect_recipient) if correct_teams.empty?
    correct_teams
  end

  def notify_rejection(type)
    case type
    when :no_customer
      RejectionMailer
      .no_email_address(@email.from[:email], email.headers['Message-ID'])
      .deliver_now
    when :incorrect_recipient
      RejectionMailer
      .incorrect_recipient(@email.from[:email], email.headers['Message-ID'])
      .deliver_now
    end
  end
end
