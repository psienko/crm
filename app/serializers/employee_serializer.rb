class EmployeeSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  attributes :id,
             :firstname,
             :lastname,
             :avatar,
             :email,
             :last_sign_in_at,
             :current_sign_in_at,
             :avatar_thumb
  has_one :team

  def avatar_thumb
    object.decorate.avatar_thumb
  end
end
