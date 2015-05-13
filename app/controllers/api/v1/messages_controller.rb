class Api::V1::MessagesController < ApplicationController
  respond_to :json
  before_action :authenticate_employee!
  expose(:message) { Message.find(params[:id]) }

  def create
    message = Message.new(message_params)
    message.to = message.to.tr(',', ' ').tr(';', ' ').scan(/\S+@\S+/).join(', ')
    return respond_unprocessable if message.to.blank?
    
    message.sender = current_employee
    message.from = current_employee.email
    message = MessageCreator.call(MessageAsGriddler.new(message),
                                  message.sender)
    if message
      MessageSendAndUpdateJob.perform_later(message.id)
      respond_with :api, :v1, message
    else
      return respond_unprocessable
    end
  end


  private

  def respond_unprocessable
    respond_with :api, :v1, status: :unprocessable_entity
  end

  def message_params
    params.require(:message)
    .permit(:recipient_id,
            :recipient_type,
            :sender_id,
            :sender_type,
            :subject,
            :body,
            :from,
            :to,
            :date,
            :message_id,
            :in_reply_to,
            :references
    )
  end
end
