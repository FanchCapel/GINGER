class Message < ApplicationRecord
  belongs_to :user
  belongs_to :message_type
  belongs_to :experience
end
