class Api::BusinessesController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:businesses)
  expose(:business)

  def index
    respond_with businesses
  end

  def show
    respond_with business
  end

  def create
    respond_with :api, Business.create(business_params)
    
  end

  def update
    respond_with business.update(business_params)
  end

  def destroy
    respond_with business.destroy
  end

  private

  def business_params
    params.require(:customer).permit(:name, :industry, :email, :krs, :nip, :regon, :contacts, :phone_number, :city,
            :address, :postcode)
  end
end
