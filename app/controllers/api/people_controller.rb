class Api::PeopleController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:people)
  expose(:person)

  def index
    respond_with people
  end

  def show
    respond_with person
  end

  def create
    respond_with People.create(person_params)
  end

  def update
    respond_with person.update(person_params)
  end

  def destroy
    respond_with person.destroy
  end

  private

  def person_params
    params.require(:customer)
    .permit(:firstname, :lastname, :pesel, :email, :phone_number, :city,
            :address, :postcode, :date_of_birth)
  end
end
