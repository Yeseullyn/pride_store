class Customer < ApplicationRecord
  # Associations
  has_many :orders

  # Validations
  validates :full_name, :address, :province, presence: true
  validates :phone_number, :email, presence: true, uniqueness: true
end
