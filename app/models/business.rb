class Business < ActiveRecord::
  has_one :customers, as: :customerable
end
