# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#puts "Create user admin"
#User.destroy_all
#u = User.create(user: 'admin', mail: 'admin@sample.com',
#	password: 'password', password_confirmation: 'password', phone: '21341515')
#u.admin = true
#u.save

#puts "Create products"

Product.destroy_all
100.times do |i|
	Product.create(product: "iPhone #{i}",user_id: 24, describe: "worst phone ever")
end