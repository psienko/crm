class Business < ActiveRecord::Base
  has_one :customer, as: :customerable, dependent: :destroy
  after_create :create_customer

  validates_presence_of :company_name, :industry, :phone_number, :city, :address
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates :postcode, presence: true, format: { with: /[0-9]{2}-?[0-9]{3}/ }
  validates :krs, uniqueness: true, presence: true, format: { with: /\d{10}/ }
  validates :nip, uniqueness: true, presence: true, format: { with: /\d{10}/ }
  validates :regon, uniqueness: true, presence: true, format: { with: /\d{10}/ }
  #validates :contacts, presence: true

  scope :company_name, -> name { where company_name: name }
  scope :industry, -> industry { where industry: industry }
  scope :email, -> email { where email: email }
  scope :krs, -> krs { where krs: krs }
  scope :nip, -> nip { where nip: nip }
  scope :regon, -> regon { where regon: regon }
  scope :phone_number, -> phone { where phone_number: phone }
  scope :city, -> city { where city: city }
  scope :address, -> address { where address: address }
  scope :postcode, -> postcode { where postcode: postcode }
  
  default_scope { order('company_name ASC') }

  def self.search(params)
    business = Business.where(nil)
    params.map { |key, val| params.delete(key) unless val.present? }
    params.reduce(business) do |memo, (key, val)|
      memo.send("#{key.underscore}", val)
    end
  end

  def self.find_by_contact(email)
    business = Business.find_by(email: email)
    return business if business.present?
    find_in_contacts(email)
  end

  def self.find_in_contacts(email)
    result = where('contacts like ?', "%#{email}%")
    result.present? ? result : nil
  end

  def build_recipient_addresses
    addresses = contacts.present? ? eval(contacts).map { |contact| contact[:email] } : []
    addresses << email if email.present?
    addresses.join(', ')
  end

  private

  def create_customer
    Customer.create(customerable: self)
  end
end
