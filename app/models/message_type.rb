class MessageType < ApplicationRecord
  TYPE = ["Day before", "teasing1", "teasing2", "instruction", "End of exp 1", "End of exp 2", "End"]
  # Associations
  has_many :message_types

  # Validations
  validates :message_type, presence: true, inclusion: { in: TYPE }
end
