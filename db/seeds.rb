# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new(email: 'admin@blogapp.cz', password: 'securepwd1')
admin.avatar = File.open(Rails.root.join('images', 'doge.jpg'))
admin.add_role :admin
admin.skip_confirmation!
admin.save!

user = User.new(email: 'user1@blogapp.cz', password: 'securepwd2')
user.avatar = File.open(Rails.root.join('images', 'doge_angry.png'))
user.add_role :user
user.skip_confirmation!
user.save!

post_admin = Post.new(title: 'Post from Admin', body: 'Admin post Body!', user: admin)
post_admin.save!

post_user = Post.new(title: 'Post from User', body: 'User post Body!', user: user)
post_user.save!