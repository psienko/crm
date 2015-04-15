class Business < ActiveRecord::Base
  has_one :customer, as: :customerable, dependent: :destroy
  after_create :create_customer

  validates_presence_of :name, :industry, :phone_number, :city, :address
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :postcode, presence: true, format: { with: /[0-9]{2}-?[0-9]{3}/ }
  validates :krs, uniqueness: true, presence: true, format: { with: /\d{10}/ }
  validates :nip, uniqueness: true, presence: true, format: { with: /\d{10}/ }
  validates :regon, uniqueness: true, presence: true, format: { with: /\d{10}/ }
  validates :contacts, presence: true

  scope :name, -> name { where name: name }
  scope :industry, -> industry { where industry: industry }
  scope :email, -> email { where email: email }
  scope :krs, -> krs { where krs: krs }
  scope :nip, -> nip { where nip: nip }
  scope :regon, -> regon { where regon: regon }
  scope :phone_number, -> phone { where phone_number: phone }
  scope :city, -> city { where city: city }
  scope :address, -> address { where address: address }
  scope :postcode, -> postcode { where postcode: postcode }
  
  private

  def create_customer
    Customer.create(customerable: self)
  end

  def self.search(params)
    business = Business.where(nil)
    params.map{ |key, val| params.delete(key) unless val.present? }
    params.reduce(business) do |memo, (key, val)|
      memo.send("#{key.underscore}", val)
    end
  end
end
