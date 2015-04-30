class Customer < ActiveRecord::Base
  #belongs_to :message, as: :sender
  #has_one :message, as: :recipient
  belongs_to :customerable, polymorphic: true, dependent: :destroy
  belongs_to :team
end
