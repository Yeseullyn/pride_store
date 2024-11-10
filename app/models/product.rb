class Product < ApplicationRecord
  # Associations
  belongs_to :category
  has_many :order_items

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Specify the associations that Ransack can search
  def self.ransackable_associations(auth_object = nil)
    ["category", "order_items"]
  end

  # Specify the attributes that Ransack can search
  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "name", "price", "stock_quantity", "updated_at"]
  end
end
