class Message < ApplicationRecord

  # Associations
  belongs_to :message_type
  belongs_to :experience

  # Validations
  validates :message_type, presence: true
  validates :experience, presence: true

  after_create :plan_message

  private

  def plan_message
    # MessageJob.set(wait_until: Date.tomorrow.noon).perform_later(message_id)
  end
end
