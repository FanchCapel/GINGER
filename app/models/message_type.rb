class MessageType < ApplicationRecord

  # Associations
  has_many :message_types

  # Validations
  validates :type, presence: true, collection: ["Day before", "Noon", "15", "Start", "End of exp 1", "End of exp 2", "End"]

end
