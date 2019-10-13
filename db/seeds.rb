# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_ole = User.create!(name: 'Ole Dole Doffen', email: 'ole@example.com', password: 'dummy123', password_confirmation: 'dummy123' )

awesomeco = Company.create!(name: 'AwesomeCo')
boringco = Company.create!(name: 'BoringCo')

mr_smith = Accountant.create!(name: "Mr. Smith")
mr_smith.companies << boringco
awesomeco.accountants << mr_smith
boringco.accountants << mr_smith

mr_smith.transaction_logs.create!(company: awesomeco, activity_at: 1.day.ago)
mr_smith.transaction_logs.create!(company: boringco, activity_at: 2.days.ago)