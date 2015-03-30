class Customer < ActiveRecord::Base
   belongs_to :customerable, polymorphic: true, dependent: :destroy
end
