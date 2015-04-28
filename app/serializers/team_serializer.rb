class TeamSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  attributes :id, :team_name
  has_many :employees #, as: :customerable#polimorphic: true #embed: :objects, include: true
  has_many :customers
  #def customer
   # object.customer
  #end
  #def customer
    #has many
    #{id: object.customer.customerable_id, type: object.customer.customerable_type.downcase}
    #object.customer #.map { |e| { id: e.customerable_id, type: e.customerable_type } }
  #end
end
