class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :address
      t.string :province

      t.timestamps
    end
  end
end
