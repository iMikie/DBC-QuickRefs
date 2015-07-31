class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
    end
  end
end


class CreateMessages < ActiveRecord::Migration       #acting as the join table for senders/receivers
  def change
    create_table :messages do |t|
      t.string :content
      t.references :sender
      t.references :recipient
    end
  end
end
##################################################

#I want AR to enable me to use:
#   user.sent_messages
#   user.received_messages
#   user.messaged_users
#   user.message_senderss

class User < ActiveRecord::Base
  has_many :sent_messages, class_name "Message", foreign_key: :user_id
  has_many :received_messages, class_name "Message", foreign_key: :recipient_id
  has_many :messaged_users, class_name "User", through: :sent.messages, source: :recipient
  has_many :message_senders, class_name "User", through: :received.messages, source: :sender

end


class Message < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :recipient, class_name: "User"
end


joe = User.create(name: "Joe")
ellie = User.create(name: "Ellie")


Message.create(sender: joe, recipeient: ellie, content: "This hurts")

p joe.sent_messages
p ellie.received_messges
p joe.messaged_users
p ellie.message_senders
