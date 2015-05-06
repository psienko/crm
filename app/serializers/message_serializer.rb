class MessageSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  #has_one :sender, polimorfic: true
  #has_one :recipient, polimorfic: true
  attributes :id,
             :sender_id,
             :sender_type,
             :recipient_id,
             :recipient_type,
             :subject,
             :body,
             :from,
             :to,
             :date,
             :message_id,
             :in_reply_to,
             :references
             #:recipient
             #:customer_id,
             #:employee_id,
             #:team_id
  #has_one :team
  #has_one :employee

  #has_one :sender_team
  #has_one :sender_customer
  #has_one :sender_employee
  
  #def sender
   # object.sender
  #end

  #def recipient
   # object.recipient
  #end

  #def customer_id
   # if object.customerable.present? && object.customerable_type == 'Person'
    #  object.customerable.id
    #end
  #end

  #def business_id
   # if object.customerable.present? && object.customerable_type == 'Business'
    #  object.customerable.id
    #end    
  #end

  #def person
   # if object.customerable.present? && object.customerable_type == 'Person'
    #  Person.find(object.customerable_id)
    #end
  #end

  #def business
   # if object.customerable.present? && object.customerable_type == 'Business'
    #  Business.find(object.customerable_id)
    #end
  #end
end
