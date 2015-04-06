class Business < ActiveRecord::Base
  has_one :customer, as: :customerable, dependent: :destroy
  after_create :create_customer

  private

  def create_customer
    Customer.create(customerable: self)
  end
end
