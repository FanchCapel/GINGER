class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :experiences
  has_many :messages

  # Validations
  # validates :primary_number, presence: true
  # validates :primary_first_name, presence: true
  # validates :primary_last_name, presence: true
end
