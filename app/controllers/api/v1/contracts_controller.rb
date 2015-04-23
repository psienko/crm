class Api::V1::ContractsController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:contracts)
  expose(:contract) { Contract.find(params[:id]) }

  def index
    if params[:search].eql?('search') && params[:contract].present?
      respond_with Contract.search(params[:contract])
    else
      respond_with contracts
    end
  end

  def show
    respond_with contract
  end

  def create
    respond_with :api, :v1, Person.create(contract_params)
  end

  def update
    person.update(contract_params)
    respond_with contract
  end

  def destroy
    respond_with contract.destroy
  end

  private

  def person_params
    params.require(:contract)
    .permit(:content, :total_value, :additional_costs, :monthly_value, :date_of_signature, :date_of_start,
            :date_of_end)
  end
end
