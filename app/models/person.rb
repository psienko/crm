class Person < ActiveRecord::Base
  has_one :customer, as: :customerable, dependent: :destroy
  after_create :create_customer

  validates_presence_of :firstname, :lastname, :phone_number, :city, :address, :date_of_birth
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :postcode, presence: true, format: { with: /[0-9]{2}-?[0-9]{3}/ }
  validates :pesel, uniqueness: true, presence: true, format: { with: /\d{11}/ }

  scope :firstname, -> firstname { where firstname: firstname }
  scope :lastname, -> lastname { where lastname: lastname }
  scope :pesel, -> pesel { where pesel: pesel }
  scope :email, -> email { where email: email }
  scope :phone_number, -> phone { where phone_number: phone }
  scope :city, -> city { where city: city }
  scope :address, -> address { where address: address }
  scope :postcode, -> postcode { where postcode: postcode }
  scope :date_of_birth, -> date { where date_of_birth: date }
  
  default_scope { order('lastname ASC', 'firstname ASC') }
  
  private

  def create_customer
    Customer.create(customerable: self)
  end

  def self.search(params)
    params[:dateOfBirth]=Date.parse params[:dateOfBirth] if params[:dateOfBirth].present?
    person = Person.where(nil)
    params.map{ |key, val| params.delete(key) unless val.present? }
    params.reduce(person) do |memo, (key, val)|
      memo.send("#{key.underscore}", val)
    end
  end
end
