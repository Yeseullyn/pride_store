class Order < ApplicationRecord
  # Associations
  belongs_to :customer
  has_many :order_items, dependent: :destroy

  # Validations
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :created_at, presence: true
end