# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

def set_pokemons_from_json(input_file)
  spacies = JSON.load_file(input_file)
  spacies_data = {}

  spacies_data.store('number', spacies['id'])
  spacies_data.store('name', spacies['names'].find { |entry| entry['language']['name'] == 'ja-Hrkt' }['name'])
  spacies_data.store('genus', spacies['genera'].find { |entry| entry['language']['name'] == 'ja-Hrkt' }['genus'])
  spacies_data.store('flavor_text', spacies['flavor_text_entries'].find { |entry| entry['language']['name'] == 'ja-Hrkt' }['flavor_text'])

  spacies_data
end

spacies_data = set_pokemons_from_json('lib/pokemon-spacies/pokemon_1.json')
Pokemon.find_or_create_by!(number: spacies_data['number']) do | pokemon |
  pokemon.name = spacies_data['name']
  pokemon.genus = spacies_data['genus']
  pokemon.flavor_text = spacies_data['flavor_text']
end
