class Message < ApplicationRecord
    belongs_to :sent_message, class_name: "User"
    belongs_to :rec_message, class_name: "User"
end
