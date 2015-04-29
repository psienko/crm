class BusinessSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  attributes :id,
             :company_name,
             :industry,
             :email,
             :phone_number,
             :city,
             :address,
             :postcode,
             :krs,
             :nip,
             :regon,
             :contacts
  has_one :customer#, embed: :ids, include: true #, embed: :objects, include: true
  #def customerable
   # object.customerable.map { |e| { id: e.id, type: e.type } }
  #end
  #def contacts
   # object.contacts.present? ? object.contacts : {first} 
  #end
end
