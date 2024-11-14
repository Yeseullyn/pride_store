require 'faker'
require 'json'
require 'uri'
require 'net/http'
require 'open-uri'

Product.destroy_all
Category.destroy_all
Page.destroy_all
ActiveStorage::Attachment.destroy_all
ActiveStorage::Blob.destroy_all

# Create categories
categories = %w[Clothing Accessories Home_Decor Gift]
categories.each { |name| Category.create(name: name) }

# Attach an image to Active Storage from a remote URL without saving locally
def attach_image_to_product(product)
  url = "https://picsum.photos/200"

  product.image.attach(
    io: URI.open(url),
    filename: "#{product.name.parameterize}_image.jpg",
    content_type: "image/jpeg"
  )
end

# Create products with random data with Faker
70.times do
  product = Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price(range: 10..100),
    stock_quantity: rand(1..50),
    category: Category.all.sample,
    description: "#{Faker::Commerce.material} #{Faker::Commerce.product_name} - #{Faker::Marketing.buzzwords}. Perfect for #{Faker::Commerce.department(max: 1)}."
  )
  attach_image_to_product(product)
end

# Scrape data for products from a 3rd party website (https://thepridestore.com/) using the Simplescraper tool and saved as JSON.
file = File.read('db/data.json')
json_products = JSON.parse(file)

json_products.each do |product_data|
  product = Product.create(
    name: product_data["propertyName1"],
    price: Faker::Commerce.price(range: 10..100),
    stock_quantity: rand(1..50),
    category: Category.all.sample,
    description: "#{product_data["propertyName1"]} - This unique product is available at #{product_data["propertyName1_link"]}."
  )
  attach_image_to_product(product)
end

# Admin user and pages
AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Page.create(title: 'About', content: 'Rainbow united was founded in 2021 as a nonprofit organization to advancing LGBTQ+ rights. It has grown into a successful online business selling pride related merchandise to celebrate and support the LGBTQ+ community across Canada.')
Page.create(title: 'Contact', content: 'For inquiries, reach out to us at info@rainbowunited.com or call 204-123-4567.')