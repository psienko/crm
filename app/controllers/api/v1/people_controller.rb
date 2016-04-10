class Api::V1::PeopleController < ApplicationController
  respond_to :json

  before_action :authenticate_employee!
  expose(:people)
  expose(:person) { Person.find(params[:id]) }

  def index
    if params[:search].eql?('search') && params[:person].present?
      respond_with Person.search(params[:person])
    else
      respond_with people
    end
  end

  def show
    respond_with person
  end

  def create
    respond_with :api, :v1, Person.create(person_params)
  end

  def update
    person.update(person_params)
    respond_with person
  end

  def destroy
    respond_with person.destroy
  end

  private

  def redner_validations_error errors
    render json: {errors: errors.to_h}, status: :unprocessable_entity
  end

  def person_params
    params.require(:person)
    .permit(:firstname, :lastname, :pesel, :email, :phone_number, :city,
            :address, :postcode, :date_of_birth)
  end
end
