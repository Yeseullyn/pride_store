class RenameForeignKeyColumns < ActiveRecord::Migration[7.2]
  def change
    # Rename category_id_id to category_id in Products table
    rename_column :products, :category_id_id, :category_id if column_exists?(:products, :category_id_id)
    
    # Rename customer_id_id to customer_id in Orders table
    rename_column :orders, :customer_id_id, :customer_id if column_exists?(:orders, :customer_id_id)

    # Rename order_id_id and product_id_id to order_id and product_id in OrderItems table
    rename_column :order_items, :order_id_id, :order_id if column_exists?(:order_items, :order_id_id)
    rename_column :order_items, :product_id_id, :product_id if column_exists?(:order_items, :product_id_id)
  end
end
