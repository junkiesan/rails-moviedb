require "open-uri"
require "yaml"

Movie.destroy_all
puts 'Destroying directors...'
Director.destroy_all
puts 'Destroying movies...'
TvShow.destroy_all
puts 'Destroying tv shows...'

url = "https://gist.githubusercontent.com/junkiesan/5105f7827413e0244d63509c1bed572a/raw/3ea8848bbbcf0dbc888ba74d83c2421aab2a59be/imdb.yml"
file = YAML.load(open(url).read)

directors = {}

puts 'Creating directors...'
file["directors"].each do |director| 
  directors[director["slug"]] = Director.create! director.slice("first_name", "last_name")
end

puts 'Creating movies...'
file["movies"].each do |movie|
  Movie.create! movie.slice("title", "year", "synopsis").merge(director: directors[movie["director_slug"]])
end

puts 'Creating tv shows...'
file["series"].each do |tv_show|
  TvShow.create! tv_show
end

puts 'Finished!'