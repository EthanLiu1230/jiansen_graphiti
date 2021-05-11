# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Category].each(&:delete_all)

office = Category.create!(name: 'office')
school = Category.create!(name: 'school')
hotel = Category.create!(name: 'hotel')

office.children.create([{ name: 'chair' }, { name: 'desk' }, { name: 'cabinet' }])
school.children.create([{ name: 'chair' }, { name: 'desk' }])
hotel.children.create([{ name: 'bed' }, { name: 'closet' }])
