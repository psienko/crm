class Customer < ActiveRecord::Base
  has_one :message, as: :sender
  has_one :message, as: :recipient
  belongs_to :customerable, polymorphic: true, dependent: :destroy
  belongs_to :team
end
