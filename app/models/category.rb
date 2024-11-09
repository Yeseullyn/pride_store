class Category < ApplicationRecord
  # Assocations
  has_many :products

  # Validations
  validates :name, presence: true, uniqueness: true
end
