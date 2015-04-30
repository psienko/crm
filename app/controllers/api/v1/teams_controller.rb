class Api::V1::TeamsController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:teams)
  expose(:team) { Team.find(params[:id]) }

  def index
    if params[:search].eql?('search') && params[:team].present?
      respond_with Team.search(params[:team])
    elsif params[:my_team].eql?('yes')
      respond_with current_employee.team
    else
      respond_with teams
    end
  end

  def show
    respond_with team
  end

  def create
    respond_with :api, :v1, Team.create(team_params)
  end

  def update
    team.update(team_params)
    respond_with team
  end

  def destroy
    respond_with team.destroy
  end

  private

  def team_params
    params.require(:team)
    .permit(:team_name, :employee_ids)
  end
end
