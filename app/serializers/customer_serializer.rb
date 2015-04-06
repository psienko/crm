class CustomerSerializer < ActiveModel::Serializer
  embed :ids, include: true
  #has_one :customerable, polimorfic: true#, :key => :customerable_id
  attributes :id, :customerable_type, :customerable_id#, :customerable
  
  def customerable
     object.customerable
  end
end
