# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chanel = Designer.create(:name => "Chanel")
hermes = Designer.create(:name => "Hermes")

highend = Biztag.create(:name => "High End")
boutique = Biztag.create(:name => "Boutique")

chanel_photo = Tag.create(:name => "Chanel")
hermes_photo = Tag.create(:name => "Hermes")

manhattan = Borough.create(:name => "Manhattan")
bronx = Borough.create(:name => "The Bronx")
brooklyn = Borough.create(:name => "Brooklyn")
staten_island = Borough.create(:name => "Staten Island")
jersey = Borough.create(:name => "New Jersey")
queens = Borough.create(:name => "Queens")

ues = Neighborhood.create(:name => "Upper East Side")
williamsburg = Neighborhood.create(:name => "Williamsburg")
