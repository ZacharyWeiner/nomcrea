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

pepsi = Company.create!(name: "Pepsi", website: 'www.pepsi.com')
pUser = User.create!(email: 'pepsi@pepsi.com', password: 'password', password_confirmation: 'password')
pepsi.users << pUser 

tomford = Company.create!(name: "Tom Ford", website: 'www.tomford.com')
tfUser = User.create!(email: 'tom-ford@tom-ford.com', password: 'password', password_confirmation: 'password')
tomford.users << tfUser

User.create!(email: 'user@nomcrea.com', password: 'password', password_confirmation: 'password')





