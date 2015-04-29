class Api::V1::CustomersController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:customers)
  expose(:customer) { Customer.find(params[:id]) }

  def index
    respond_with customers
  end

  def show
    respond_with customer
  end

  def create
    respond_with case params[:customer_type]
                 when 'business' then Customer.create(customerable: Business.create(business_params))
                 when 'person' then  People.create(person_params)
                 end
  end

  def update
    #respond_with case params[:customer_type]
     #            when 'business' then Business.create(business_params)
     #            when 'person' then  People.create(person_params)
     #            end
    customer.update(customer_params)
    respond_with customer
  end

  def destroy
    respond_with customer.destroy
  end

  private

  def customer_params
    params.require(:customer)
    .permit(:customerable_id, :customerable_type, :team_id)
  end
end
