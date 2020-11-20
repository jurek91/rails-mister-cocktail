require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.destroy_all
Dose.destroy_all
Cocktail.destroy_all



file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
article = Cocktail.new(name: 'NES')
article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')


puts "Creating Delicious Ingredients.....mmmmmmm"

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"


drinks_list = HTTParty.get(url)

ingredients_list = drinks_list["drinks"]

ingredients_list.each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end

puts "Created :)"
