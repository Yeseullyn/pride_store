class CreateOrderItems < ActiveRecord::Migration[7.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.decimal :price_at_purchase
      t.references :order_id, null: false, foreign_key: true
      t.references :product_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
