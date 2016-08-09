# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(name: 'Milk', theshold_to_order: 5, desired_total: 20, in_stock: 3, price: '95', day_to_order: nil, unit_type: 'Carton', base_product: true)
Product.create(name: 'Coffee', theshold_to_order: 2, desired_total: 4, in_stock: 1, price: '105', day_to_order: nil, unit_type: 'Bag', base_product: true)

# => #<Product id: nil, theshold_to_order: nil, in_stock: nil, price: nil, name: nil, day_to_order: nil, unit_type: nil, created_at: nil, updated_at: nil>
# => [:integer, :integer, :integer, :decimal, :string, :string, :string, :datetime, :datetime]
