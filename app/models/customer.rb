class Customer < ActiveRecord::Base
  has_many :sent_messages, as: :sender, class_name: 'Message'
  has_many :received_messages, as: :recipient, class_name: 'Message'
  belongs_to :customerable, polymorphic: true, dependent: :destroy
  belongs_to :team

  def self.find_by_email(email)
    person = Person.find_by(email: email)
    return person.customer if person.present?
    business = Business.find_by_contact(email)
    business[0].customer if business.present?
  end
end
