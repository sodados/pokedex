require 'uri'
require 'net/http'
require 'json'

# 取得したいポケモンのid指定
ids = 1..3

File.open('scripts/list_pokemon-spacies.json', 'r') do | input_file |
    json_list_pokemon_spacies = JSON.load(input_file)

    ids.each do | id |
        url = URI.parse(json_list_pokemon_spacies['results'][id-1]['url'])
        json_pokemon_spacies = Net::HTTP.get(url)
        result_pokemon_spacies = JSON.parse(json_pokemon_spacies)

        File.open("lib/pokemon-spacies/pokemon_#{id}.json", 'w') do | output_file |
            JSON.dump(result_pokemon_spacies, output_file)
        end
    end
end
