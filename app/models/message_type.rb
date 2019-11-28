class MessageType < ApplicationRecord
  TYPE = ["Day before", "Noon", "15", "Start", "End of exp 1", "End of exp 2", "End"]
  # Associations
  has_many :message_types

  # Validations
  validates :type, presence: true, inclusion: { in: TYPE }
end
