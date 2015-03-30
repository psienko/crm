class Person < ActiveRecord::Base
  has_one :customer, as: :customerable
  after_create :create_customer

  private

  def create_customer
    Customer.create(customerable: self)
  end
end
