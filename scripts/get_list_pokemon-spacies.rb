require 'uri'
require 'net/http'
require 'json'

uri = URI.parse('https://pokeapi.co/api/v2/pokemon-species/?limit=1100')
json = Net::HTTP.get(uri)
result = JSON.parse(json)

File.open('scripts/list_pokemon-spacies.json', 'w') do | f |
    JSON.dump(result, f)
end
