class CustomerSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  has_one :customerable, polimorfic: true, embed: :ids # , :key => :customerable_id
  attributes  :id, :customerable_type, :customerable_id # , :customerable
  #has_one :person, key: :customerable_id

  #def person
   # object.customerable
  #end
  #def person_id
   # object.customerable_id
  #end
  #def customerable
   # {customerable: object.customerable.id, customerableType: object.customerable_type.downcase} if object.customerable.present?
  #end
  #def customerable
   #  object.customerable
  #end
end
