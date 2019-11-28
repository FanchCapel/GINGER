class Experience < ApplicationRecord
  validates :user_id, presence: true
  validates :budget_cents, presence: true
  validates :city, presence: true
  validates :date, presence: true
  validates :time_slot, presence: true

  belongs_to :user

  has_many :experience_slices, dependent: :destroy
  has_many :messages

  def generate_message
    MessageType.all.each do |message_type|
      self.messages << Message.new(message_type: message_type)
    end
    self.save
  end
end
