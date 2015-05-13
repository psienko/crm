class Api::V1::SentMessagesController < ApplicationController
  respond_to :json
  before_action :verify_sender, only: :create
  before_action :authenticate_employee!
  expose(:sent_messages) do
    Message.where(sender: current_employee) +
      Message.where(sender: current_employee.team)
  end

  def index
    if params[:sent_by].present?
      respond_with case params[:sent_by]
                   when 'Employee' then Message.all_from(current_employee)
                   when 'Team' then Message.all_from_team(current_employee)
                   end
    else
      respond_with sent_messages
    end
  end


  def create
    message = SourceAndTargetEmailDeterminer.call(Message.new(message_params))
    message = MessageCreator.call(MessageAsGriddler.new(message),
                                  message.sender, message.recipient)
    if message.recipient_type == 'Customer' || message.recipient.blank?
      MessageSendAndUpdateJob.perform_later(message.id)
    end
    message.date = DateTime.now
    render json: message, serializer: SentMessageSerializer
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
        respond_with :api, :v1, status: :unprocessable_entity
      end
    end
  end

  def message_params
    params.require(:sent_message)
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
