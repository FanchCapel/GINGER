class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :experiences

  # Validations
  validates :primary_number, presence: true, format: { with: /07\d{8}/i, message: "Votre numero doit se présenter comme suit: 0712345678" }
  validates :secondary_number, format: { with: /07\d{8}/i, message: "Votre numero doit se présenter comme suit: 0712345678" }
  # validates :primary_first_name, presence: true
  # validates :primary_last_name, presence: true
end
