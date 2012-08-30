# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# puts "Create user admin"
# User.destroy_all
# u = User.create(user: 'admin', mail: 'admin@sample.com',
# 	password: 'password', password_confirmation: 'password', phone: '21341515')
# u.admin = true
# u.save
# 10.times do |i|
# 	if i > 6
# 	User.create(user: "admin#{i}", mail: 'admin@sample.com',
# 	password: 'password', password_confirmation: 'password', phone: '21341515')
# 	else
# 		User.create(user: "admin #{i}", mail: 'admin@sample.com',
# 	password: 'password', password_confirmation: 'password', phone: '21341515',admin: true)
# 	end
# end
# 	 puts "Create products"

# p = User.all
# p.each do |p1|
# 	p1.update_attributes( mail: 'admin@sample.com',
#  	password: '123456', password_confirmation: '123456', phone: '21341515',admin: true,:image =>File.open(File.join("#{Rails.root}/public", 'chutieu.jpg')))
# 	end

# Product.destroy_all
# 100.times do |i|
# 	Product.create(product: "iPhone#{i} ",user_id: User.all.sample.id, describe: "worst phone ever",inventory:i*10,price: i*20,image: File.open(File.join("#{Rails.root}/public", 'chutieu.jpg')),id_type: 1,inventory: 10*i)
# end
Order.destroy_all
# 300.times do |i|
# 	Order.create(:product_id => Product.all.sample.id, :user_id => User.all.sample.id ,quantily: i  )
# end
