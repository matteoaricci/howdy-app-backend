class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: true
    validates :email, uniqueness: true

    has_many :sent_messages, foreign_key: :sender_id, class_name: "DirectMessage"
    has_many :rec_messages, foreign_key: :recipient_id, class_name: "DirectMessage"
    
    has_many :communities, foreign_key: :owner_id, class_name: "Community"
end
