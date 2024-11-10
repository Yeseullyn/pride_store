class OrderItem < ApplicationRecord
  # Associations
  belongs_to :order
  belongs_to :product

  # Validations
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :price_at_purchase, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  # Specify the attributes that Ransack can search
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "price_at_purchase", "product_id", "quantity", "updated_at"]
  end
end