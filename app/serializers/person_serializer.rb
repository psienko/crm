class PersonSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :customer, embed: :objects, include: true
  attributes :id, :firstname, :lastname, :pesel, :email, :phone_number, :city, :address, :postcode, :date_of_birth #,:customerable

  def customerable
    object.customerable.map { |e| { id: e.id, type: e.type } }
  end

  def date_of_birth
    object.date_of_birth.strftime("%m/%d/%Y") if object.date_of_birth.present?
  end
end
