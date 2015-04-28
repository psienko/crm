class Customer < ActiveRecord::Base
   belongs_to :customerable, polymorphic: true, dependent: :destroy
   belongs_to :team
end
