require 'faker'

# Create categories
categories = %w[Clothing Accessories Home_Decor]
categories.each { |name| Category.create(name: name) }

# Create products with random data
10.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10..100),
    stock_quantity: rand(1..50),
    category_id: Category.all.sample
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?