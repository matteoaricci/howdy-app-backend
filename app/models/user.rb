class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: true
    validates :email, uniqueness: true

    has_many :sent_messages, foreign_key: :sender_id, class_name: "Message"
    has_many :rec_messages, through: :sent_messages
    has_many :rec_messages, foreign_key: :recipient_id, class_name: "Message"
    has_many :sent_messages, through: :rec_messages
end
