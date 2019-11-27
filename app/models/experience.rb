class Experience < ApplicationRecord
  validates :user_id, presence: true
  validates :budget_cents, presence: true
  validates :city, presence: true
  validates :date, presence: true
  validates :time_slot, presence: true

  belongs_to :user

  has_many :experience_slices, dependent: :destroy
  has_many :messages
end
