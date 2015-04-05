class CustomersController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:customers)
  expose(:customer)

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
    respond_with case params[:customer_type]
                 when 'business' then Business.create(business_params)
                 when 'person' then  People.create(person_params)
                 end
    respond_with customer.update(customer_params)
  end

  def destroy
    respond_with customer.destroy
  end

  private

  def business_params
    params.require(:customer).permit(:name, :industry, :email, :krs, :nip, :regon, :contacts)
  end

  def person_params
    params.require(:customer)
    .permit(:firstname, :lastname, :pesel, :email, :phone_number, :city,
            :address, :postcode, :date_of_birth)
  end
end
