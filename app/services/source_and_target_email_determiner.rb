class SourceAndTargetEmailDeterminer
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def self.call(message)
    new(message).call
  end

  def call
    message.from = determine_source_address
    message.to = determine_target_address
    message
  end

  private

  def determine_source_address
    case message.sender_type
    when 'Team' then message.sender.build_email_address
    when 'Employee' then message.sender.email
    end
  end

  def determine_target_address
    return message.recipient.build_email_address if message.recipient.class.name == 'Team'
    return message.recipient.email if message.recipient.class.name == 'Employee'
    return message.recipient.customerable.email if message.recipient.person?
    message.recipient.customerable.build_recipient_addresses if message.recipient.business?
  end
end
