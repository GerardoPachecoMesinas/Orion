# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create( email:"user1@test", password:"usuario1", password_confirmation:"usuario1" )
User.create( email:"user2@test", password:"usuario2", password_confirmation:"usuario2" )
User.create( email:"user3@test", password:"usuario3", password_confirmation:"usuario3" )
User.create( email:"user4@test", password:"usuario4", password_confirmation:"usuario4" )
