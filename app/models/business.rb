class Business < ActiveRecord::
  has_many :customers, as: :customerable
end
