class Person < ActiveRecord::Base
  has_many :customers, as: :customerable
end
