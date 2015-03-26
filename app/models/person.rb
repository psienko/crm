class Person < ActiveRecord::Base
  has_one :customers, as: :customerable
end
