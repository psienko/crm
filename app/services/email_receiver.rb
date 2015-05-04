class EmailReceiver
  attr_accessor :email

  def initialize(email)
    @email = email
  end

  def self.call(email)
    new(email).call
  end

  def call
    binding.pry
    customer = check_and_get_sender
    return false unless customer.present?
    recipients = check_and_get_recipient_for(customer)
    return false unless recipients.present?
  end

  private

  def check_and_get_sender
    customer = Customer.find_by_email(email.from[:email])
    notify_rejection(:no_customer) unless customer.present?
    customer
  end

  def check_and_get_recipient_for(customer)
    recipients_list = email.to.map { |v| v[:token] }
    teams = Team.where(team_name: recipients_list)
    correct_teams = teams.select { |val| val == customer.team }
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
