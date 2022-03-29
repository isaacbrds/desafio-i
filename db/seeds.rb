# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@mail.com', password: '123456', password_confirmation: '123456')
User.create(email: 'user@mail.com', password: '123456', password_confirmation: '123456')
User.create(email: 'almoxarife@mail.com', password: '123456', password_confirmation: '123456')

puts "Usuário Criado"

FactoryBot.create_list(:material, 20)

puts "Materiais Criados"

