class PersonSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  attributes :id,
             :firstname,
             :lastname,
             :pesel,
             :email,
             :phone_number,
             :city,
             :address,
             :postcode,
             :date_of_birth #, :customer
  has_one :customer, embed: :ids, include: true #, as: :customerable#polimorphic: true #embed: :objects, include: true

  #def customer
   # object.customer
  #end
  #def customer
    #has many
    #{id: object.customer.customerable_id, type: object.customer.customerable_type.downcase}
    #object.customer #.map { |e| { id: e.customerable_id, type: e.customerable_type } }
  #end

  def date_of_birth
    object.date_of_birth.strftime("%m/%d/%Y") if object.date_of_birth.present?
  end
end
