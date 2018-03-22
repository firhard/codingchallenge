# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Product1 = Product.create(title: 'iPhoneX', description: 'Latest iPhone')
Product2 = Product.create(title: 'Galaxy S9', description: 'Latest Galaxy')
Product3 = Product.create(title: 'Macbook Pro', description: 'Best Macbook')
Product4 = Product.create(title: 'Dell XPS 13', description: 'Windows Laptop')



Category1 = Category.create(name: 'Phone')
Category2 = Category.create(name: 'Apple')
Category3 = Category.create(name: 'Laptop')

Product1.categories << Category1
Product1.categories << Category2
Product2.categories << Category1
Product3.categories << Category2
Product3.categories << Category3
Product4.categories << Category3

