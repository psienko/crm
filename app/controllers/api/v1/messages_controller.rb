class Api::V1::MessagesController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:message) { Message.find(params[:id]) }

  def index
    response = case params[:received]
               when 'all' then Message.all_to(current_employee)
               when 'to_me' then Message.to_current(current_employee)
               when 'to_team' then Message.to_team(current_employee)
               end if params[:received].present?
    response=Message.all if response.blank?
    respond_with response
  end

  def show
    respond_with message
  end

  def create
    #respond_with :api, :v1, Team.create(team_params)
  end

  def update
  end

  def destroy
    respond_with message.destroy
  end

  private

  def team_params
    params.require(:message)
    .permit(:subject, :body, :recipient)
  end
end
