class HomeController < ApplicationController
  def show
    redirect_to new_employee_session_path unless employee_signed_in?
  end
end
