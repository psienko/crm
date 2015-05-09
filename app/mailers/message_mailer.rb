class MessageMailer < ActionMailer::Base
  def send_message(message)
    mail(
      from: "CRM-PRZ <#{message.from}>",
      to: message.to,
      subject: message.subject
    ) { |format| format.html { message.body } }
    headers['In-Reply-To'] = message.in_reply_to
    headers['References'] = message.references
  end
end
