class Api::V1::ReceivedMessagesController < ApplicationController
  respond_to :json
  before_action :verify_sender, only: :create
  before_action :authenticate_employee!
  expose(:received_messages) do
    Message.where(recipient: current_employee) +
      Message.where(recipient: current_employee.team)
  end

  def index
    if params[:received_by].present?
      respond_with case params[:received_by]
                   when 'Employee' then Message.all_to(current_employee)
                   when 'Team' then Message.all_to_team(current_employee)
                   end
    else
      respond_with received_messages
    end
  end
end
