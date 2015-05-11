class SentMessageSerializer < ActiveModel::Serializer
  embed :ids, include: true, embed_in_root: true
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
end
