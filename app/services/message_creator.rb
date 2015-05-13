class MessageCreator
  attr_accessor :email, :sender, :recipients

  def initialize(email, sender, recipients = nil)
    @email, @sender = email, sender
    @recipients = recipients.is_a?(Array) ? recipients : [recipients]
  end

  def self.call(email, sender, recipients = nil)
    new(email, sender, recipients).call
  end

  def call
    target = case email.to.is_a?(Array)
             when true then email.to.map { |v| "<#{v[:name]} #{v[:email]}> " }.to_s
             when false then email.to
             end
    date = email.headers['Date'].present? ? email.headers['Date'] : DateTime.now
    messages = recipients.map do |recipient|
      Message.create!(
        sender: sender,
        recipient: recipient,
        subject: email.subject,
        body: email.raw_html.present? ? email.raw_html : email.raw_body,
        from: email.from[:email],
        to: target,
        date: date,
        message_id: email.headers['Message-ID'],
        in_reply_to: email.headers['In-Reply-To'],
        references: email.headers['References']
      )
    end
    return messages[0] if messages.size == 1
    messages
  end
end
