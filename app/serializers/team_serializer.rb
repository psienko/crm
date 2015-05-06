class TeamSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
  attributes :id, :team_name
  has_many :employees
  has_many :customers
  has_many :sent_messages, as: :sender
  has_many :received_messages, as: :recipient
end
