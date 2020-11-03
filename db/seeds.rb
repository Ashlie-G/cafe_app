# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Menu.destroy_all
menu = Menu.create!(title: "Lunch")

items = [
    {tiem: "Latte", price: 4.50, quality: 1, menus: [menu]},
    {tiem: "Tea", price: 3.50, quality: 1, menus: [menu]},
    {tiem: "Scone", price: 5.00, quality: 1, menus: [menu]},
    {tiem: "Danish", price: 5.00, quality: 1, menus: [menu]}
]
MenuItem.destroy_all

MenuItem.create!(items)
#use '!' so you always get an error if it fails to create

#this is not dry, but also works
# MenuItem.create(tiem: "Latte", price: 4.50, quality: 1)
# MenuItem.create(tiem: "Tea", price: 3.50, quality: 1)
# MenuItem.create(tiem: "Scone", price: 5.00, quality: 1)
# MenuItem.create(tiem: "Danish", price: 5.00, quality: 1)