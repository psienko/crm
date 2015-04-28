class Api::V1::EmployeesController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:employees)
  expose(:employee) { Employee.find(params[:id]) }

  def index
    if params[:search].eql?('search') && params[:employee].present?
      respond_with Employee.search(params[:employee])
    elsif params[:team].eql?('unassigned')
      respond_with Employee.where(team_id: nil)
    else
      respond_with employees
    end
  end

  def show
    respond_with employee
  end

  def create
    respond_with :api, :v1, Employee.create(employee_params)
  end

  def update
    employee.update(employee_params)
    respond_with employee
  end

  def destroy
    respond_with employee.destroy
  end

  private

  def employee_params
    params.require(:employee)
    .permit(:firstname, :lastname, :avatar, :email, :team_id)
  end
end
