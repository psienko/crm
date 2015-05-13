class Api::V2::MessagesCountersController < ApplicationController
  before_action :authenticate_employee!

  def index
    empl_messages = current_employee.received_messages.count
    team_messages = current_employee.team.received_messages.count
    resp = { empl_messages: empl_messages, team_messages: team_messages }
    render json: resp
  end
end
