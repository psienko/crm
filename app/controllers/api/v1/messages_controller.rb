class Api::V1::MessagesController < ApplicationController
  respond_to :json
  before_action :verify_sender, only: :create
  before_action :authenticate_employee!
  expose(:message) { Message.find(params[:id]) }

  def index
    response = case params[:received]
               when 'all' then Message.all_to(current_employee)
               when 'to_me' then Message.to_current(current_employee)
               when 'to_team' then Message.to_team(current_employee)
               end if params[:received].present?
    response = Message.all if response.blank?
    respond_with response
  end

  def show
    respond_with message
  end

  def create
    message = SourceAndTargetEmailDeterminer.call(Message.new(message_params))
    message = MessageCreator.call(MessageAsGriddler.new(message),
                                  message.sender, message.recipient)
    if message.recipient_type == 'Customer'
      MessageSendAndUpdateJob.perform_later(message.id)
    end
    message.date = DateTime.now
    respond_with :api, :v1, message
  end


  private

  def verify_sender
    case message_params[:sender_type]
    when 'Employee'
      if message_params[:sender_id] != current_employee.id
        respond_with :api, :v1, status: :unprocessable_entity
      end
    when 'Team'
      if message_params[:sender_id] != current_employee.team.id
        respond_with  :api, :v1, status: :unprocessable_entity
      end
    end
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
