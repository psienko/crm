class CustomerSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  #has_one :customerable, polimorfic: true, embed: :ids # , :key => :customerable_id
  has_one :team
  attributes  :id, :customerable_type, :customerable_id, :person_id, :business_id # , :customerable
  has_one :person
  has_one :business
  has_many :sent_messages, as: :sender
  has_many :received_messages, as: :recipient
  
  def person_id
    if object.customerable.present? && object.customerable_type == 'Person'
      object.customerable.id
    end
  end

  def business_id
    if object.customerable.present? && object.customerable_type == 'Business'
      object.customerable.id
    end    
  end

  def person
    if object.customerable.present? && object.customerable_type == 'Person'
      Person.find(object.customerable_id)
    end
  end

  def business
    if object.customerable.present? && object.customerable_type == 'Business'
      Business.find(object.customerable_id)
    end
  end
end
