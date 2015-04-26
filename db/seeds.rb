# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do 
	user = User.create(username: Faker::Name.first_name, email: Faker::Internet.email, password: Faker::Internet.password)
	5.times do
		article = Article.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraph)
		user.articles << article
	end
end