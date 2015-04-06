class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :name, :industry, :email, :phone_number, :city, :address, :postcode, :krs, :nip, :regon
  #has_one :customer, embed: :objects, include: true
  #def customerable
   # object.customerable.map { |e| { id: e.id, type: e.type } }
  #end
end
