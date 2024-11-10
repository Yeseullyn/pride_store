class Category < ApplicationRecord
  # Assocations
  has_many :products

  # Validations
  validates :name, presence: true, uniqueness: true

    # Allow Ransack to search through associations
  def self.ransackable_associations(auth_object = nil)
    ["products"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
