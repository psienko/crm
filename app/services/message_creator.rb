class MessageCreator
  attr_accessor :email, :sender, :recipients

  def initialize(email, sender, recipients)
    @email, @sender, @recipients = email, sender, recipients
  end

  def self.call(email, sender, recipients)
    new(email, sender, recipients).call
  end

  def call
    recipients.map do |recipient|
      Message.create!(
        sender: sender,
        recipient: recipient,
        subject: email.subject,
        body: email.raw_html.present? ? email.raw_html : email.raw_body,
        from: email.from[:email],
        to: email.to.map { |v| "<#{v[:name]} #{v[:email]}> " }.to_s,
        date: email.headers['Date'],
        message_id: email.headers['Message-ID'],
        in_reply_to: email.headers['In-Reply-To'],
        references: email.headers['References']
      )
    end
  end
end
