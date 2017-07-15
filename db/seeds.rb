# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coke = Company.create!(name: "CocaCola", website: 'www.coke.com')
puts "Company Coke Created"
ccUser = User.create!(email: 'coke@coke.com', display_name: 'Coke Co', password: 'password', password_confirmation: 'password')
puts "Company Coke User Created"
coke.users << ccUser 
puts "Company Coke User Asigned to company"
coke.proposals.create!(title: "Cokes 1st proposal", content: 'This is a description of cokes first proposal', proposal_type: 'Videography', price: 8000)
coke.proposals.first.requirements.create!(title: "do coke", description: "make coke happen")
puts "Company Coke Proposal Created"


pepsi = Company.create!(name: "Pepsi", website: 'www.pepsi.com')
puts "Company Pepsi Created"
pUser = User.create!(email: 'pepsi@pepsi.com', display_name: 'Pepsi Co', password: 'password', password_confirmation: 'password')
puts "Company Pepsi User Created"
pepsi.users << pUser 
puts "Company Pepsi User Asigned to company"
pepsi.proposals.create!(title: "Pepsis 1st proposal", content: 'This is a description of pepsis first proposal', proposal_type: 'Photography', price: 5000)
pepsi.proposals.first.requirements.create!(title: "do pepsi", description: "make pepsi happen")
puts "Company Pepsi Proposal Created"


tomford = Company.create!(name: "Tom Ford", website: 'www.tomford.com')
puts "Company Tom Ford Created"
tfUser = User.create!(email: 'tom-ford@tom-ford.com',display_name: 'Tom Ford', password: 'password', password_confirmation: 'password')
puts "Company Tom Ford User Created"
tomford.users << tfUser
puts "Company Tom Ford User Asigned to company"
tomford.proposals.create!(title: "Tom Fords 1st proposal", content: 'This is a description of tom fords first proposal', proposal_type: 'Drone', price: 1000)
tomford.proposals.first.requirements.create!(title: "do tom ford", description: "make tom ford happen")
puts "Company Tom Ford Proposal Created"

nomCrea1 = User.create!(email: 'creative@nomcrea.com', display_name: 'NomCre One', password: 'password', password_confirmation: 'password')
puts "User Created: creative@nomcrea.com"
nomCrea1Portfolio1 = Portfolio.create!(title: 'nomCrea1 - Photography', user: nomCrea1)
puts "Portfolio Created for User: creative@nomcrea.com"
nomCrea1Portfolio1.portfolio_items.create(title: 'Photography Exibit 1', description: "Published works from Job XYZ")
nomCrea1Portfolio1.portfolio_items.create(title: 'Photography Exibit 2', description: "Published works from Job ABC")
nomCrea1.portfolios << nomCrea1Portfolio1
puts 'Portfolio Items Created For User: creative@nomcrea.com Portfolio 1'

nomCrea1Portfolio2 = Portfolio.create!(title: 'nomCrea1 - Videography', user: nomCrea1)
puts "Portfolio2 Created for User: creative@nomcrea.com"
nomCrea1Portfolio2.portfolio_items.create(title: 'Videography Exibit 1', description: "Published works from Job ABC")
nomCrea1Portfolio2.portfolio_items.create(title: 'Videography Exibit 2', description: "Published works from Job XYZ")
nomCrea1.portfolios << nomCrea1Portfolio2
puts 'Portfolio Items Created For User: creative@nomcrea.com Portfolio 2'



nomCrea2 = User.create!(email: 'creative2@nomcrea.com', display_name: 'Nomcrea Two', password: 'password', password_confirmation: 'password')
puts "User Created: creative2@nomcrea.com"
nomCrea2Portfolio1 = Portfolio.create!(title: 'nomCrea2 - Photography', user: nomCrea2)
puts "Portfolio Created for User: creative2@nomcrea.com"
nomCrea2Portfolio1.portfolio_items.create(title: 'Photography Exibit 2.1', description: "Published works from Job XYZ")
nomCrea2Portfolio1.portfolio_items.create(title: 'Photography Exibit 2.2', description: "Published works from Job ABC")
nomCrea2.portfolios << nomCrea2Portfolio1
puts 'Portfolio Items Created For User: creative2@nomcrea.com Portfolio 1'

nomCrea2Portfolio2 = Portfolio.create!(title: 'nomCrea2 - Videography', user: nomCrea2)
puts "Portfolio2 Created for User: creative2@nomcrea.com"
nomCrea2Portfolio2.portfolio_items.create(title: 'Videography Exibit 2.1', description: "Published works from Job ABC")
nomCrea2Portfolio2.portfolio_items.create(title: 'Videography Exibit 2.2', description: "Published works from Job XYZ")
nomCrea2.portfolios << nomCrea2Portfolio2
puts 'Portfolio Items Created For User: creative2@nomcrea.com Portfolio 2'


puts 'Creating Tags'

Tag.create!(name: 'beach', tag_type: 'scene')
Tag.create!(name: 'sunset', tag_type: 'scene')
Tag.create!(name: 'sunrise', tag_type: 'scene')
Tag.create!(name: 'photography', tag_type: 'skill')
Tag.create!(name: 'videography', tag_type: 'skill')
Tag.create!(name: 'drone', tag_type: 'skill')
asia = Tag.create!(name: 'asia', tag_type: 'region')
thailand = Tag.create!(name: 'thailand', tag_type: 'country', parent_id: asia.id)
Tag.create!(name: 'chang mai', tag_type: 'city', parent_id: thailand.id)
Tag.create!(name: 'bangkok', tag_type: 'city', parent_id: thailand.id)
china = Tag.create!(name: 'china', tag_type: 'country', parent_id: asia.id)
Tag.create!(name: 'shanghai', tag_type: 'city', parent_id: china.id)
Tag.create!(name: 'beijing', tag_type: 'city', parent_id: china.id)
Tag.create!(name: 'hongkong', tag_type: 'city', parent_id: china.id)
europe = Tag.create!(name: 'europe', tag_type: 'region')
england = Tag.create!(name: 'england', tag_type:'country', parent_id: europe.id)
Tag.create!(name: 'london', tag_type: 'city', parent_id: england.id)
france = Tag.create!(name: 'france', tag_type:'country', parent_id: europe.id)
Tag.create!(name: 'paris', tag_type: 'city', parent_id: france.id)
na = Tag.create!(name: 'north america', tag_type: 'region')
us = Tag.create!(name: 'united states', tag_type: 'country', parent_id: na.id)
Tag.create!(name: 'new york city', tag_type: 'city', parent_id: us.id)
puts 'End Creating Tags'




