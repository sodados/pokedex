require 'uri'
require 'net/http'
require 'json'

uri = URI.parse('https://pokeapi.co/api/v2/type')
json = Net::HTTP.get(uri)
result = JSON.parse(json)

File.open('lib/type/list_type.json', 'w') do | f |
    JSON.dump(result, f)
end
