class Message < ApplicationRecord

  # Associations
  belongs_to :user
  belongs_to :message_type
  belongs_to :experience

  # Validations
  validates :user, presence: true
  validates :content, presence: true
  validates :message_type, presence: true
  validates :experience, presence: true
end
