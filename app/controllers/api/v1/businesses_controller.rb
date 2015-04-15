class Api::V1::BusinessesController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:businesses)
  expose(:business) { Business.find(params[:id]) }

  def index
    if params[:search].eql?('search') && params[:business].present?
      respond_with Business.search(params[:business])
    else
      respond_with businesses
    end
  end

  def show
    respond_with business
  end

  def create
    respond_with :api, :v1, Business.create(business_params) 
  end

  def update
    business.update(business_params)
    respond_with business
  end

  def destroy
    respond_with business.destroy
  end

  private

  def business_params
    params.require(:business).permit(:company_name, :industry, :email, :krs, :nip, :regon, :contacts, :phone_number, :city,
            :address, :postcode)
  end
end
