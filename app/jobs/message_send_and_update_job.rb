class MessageSendAndUpdateJob < ActiveJob::Base
  queue_as :email

  def perform(message_id)
    message = Message.find(message_id)
    outbound = MessageMailer.send_message(message).deliver_now
    message.message_id = outbound['Message-ID'].value
    message.date = outbound['date'].value
    message.save!
  end
end
