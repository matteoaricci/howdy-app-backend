class DirectMessage < ApplicationRecord
    belongs_to :sent_message, foreign_key: :sender_id, class_name: "User"
    belongs_to :rec_message, foreign_key: :recipient_id, class_name: "User"
end
