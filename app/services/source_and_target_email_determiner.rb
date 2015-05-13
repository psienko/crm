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
    return target_for_unknown_recipient if message.recipient.blank?
    return message.recipient.build_email_address if message.recipient.class.name == 'Team'
    return message.recipient.email if message.recipient.class.name == 'Employee'
    return message.recipient.customerable.email if message.recipient.person?
    message.recipient.customerable.build_recipient_addresses if message.recipient.business?
  end

  def target_for_unknown_recipient
    return message.to if message.to.present?
    if message.in_reply_to.present?
      found_by_message_id = Message.find_by(message_id: message.in_reply_to)
      return found_by_message_id.to if found_by_message_id.present?
    end
  end
end
