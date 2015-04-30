class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :sender, polymorphic: true
      t.references :recipient, polymorphic: true
      t.string :subject
      t.text :body
      t.string :from
      t.string :to
      t.datetime :date
      t.string :message_id
      t.string :in_reply_to
      t.text :references
      t.timestamps null: false
    end
  end
end
