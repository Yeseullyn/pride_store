require 'faker'

Product.destroy_all
Category.destroy_all

# Create categories
categories = %w[Clothing Accessories Home_Decor Gift]
categories.each { |name| Category.create(name: name) }

# Create products with random data
100.times do
  Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10..100),
    stock_quantity: rand(1..50),
    category: Category.all.sample,
    description: "#{Faker::Commerce.material} #{Faker::Commerce.product_name} - #{Faker::Marketing.buzzwords}. Perfect for #{Faker::Commerce.department(max: 1)}."
  )
end

AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# db/seeds.rb
Page.create(title: 'About', content: 'Rainbow united was founded in 2021 as a nonprofit organization to advancing LGBTQ+ rights. It has grown into a successful online business selling pride related merchandise to celebrate and support the LGBTQ+ community across Canada.')
Page.create(title: 'Contact', content: 'For inquiries, reach out to us at info@rainbowunited.com or call 204-123-4567.')