# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coke = Company.create!(name: "CocaCola", website: 'www.coke.com')
ccUser = User.create!(email: 'coke@coke.com', password: 'password', password_confirmation: 'password')
coke.users << ccUser 
coke.proposals.create!(title: "Cokes 1st proposal", content: 'This is a description of cokes first proposal')
coke.proposals.first.requirements.create!(title: "do coke", description: "make coke happen")

pepsi = Company.create!(name: "Pepsi", website: 'www.pepsi.com')
pUser = User.create!(email: 'pepsi@pepsi.com', password: 'password', password_confirmation: 'password')
pepsi.users << pUser 
pepsi.proposals.create!(title: "Pepsis 1st proposal", content: 'This is a description of pepsis first proposal')
pepsi.proposals.first.requirements.create!(title: "do pepsi", description: "make pepsi happen")

tomford = Company.create!(name: "Tom Ford", website: 'www.tomford.com')
tfUser = User.create!(email: 'tom-ford@tom-ford.com', password: 'password', password_confirmation: 'password')
tomford.users << tfUser
tomford.proposals.create!(title: "Tom Fords 1st proposal", content: 'This is a description of tom fords first proposal')
tomford.proposals.first.requirements.create!(title: "do tom ford", description: "make tom ford happen")

User.create!(email: 'user@nomcrea.com', password: 'password', password_confirmation: 'password')







