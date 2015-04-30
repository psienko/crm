class Api::V1::UsersTeamController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:users_team) { current_employee.team }
  

  def index
    respond_with users_team
  end
end
