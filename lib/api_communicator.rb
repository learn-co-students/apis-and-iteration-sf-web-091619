require 'rest-client'
require 'json'
require 'pry'


def get_all_info
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
end

def get_character_movies_from_api(character_name)
  #make the web request
  char = get_all_info["results"].find { |char_info| char_info["name"].downcase == character_name }
  
  char_urls = char["films"] #array of films

  char_films = char_urls.map do |char_film|
    JSON.parse(RestClient.get(char_film))
  end

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  output = films.map do |film|
    "Episode #{roman_numerals(film['episode_id'])}. #{film['title']}"
  end.sort
  output.map { |episode| p episode }
end

def roman_numerals(num)
  if num == 1
    'I'
  elsif num == 2
    'II'
  elsif num == 3
    'III'
  elsif num == 4
    'IV'
  elsif num == 5
    'V'
  elsif num == 6
    'VI'
  elsif num == 7
    'VII'
  elsif num == 8
    'VIII'
  elsif num == 9
    'IX'
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
