require "open-uri"
require "yaml"

url = "https://gist.githubusercontent.com/junkiesan/5105f7827413e0244d63509c1bed572a/raw/3ea8848bbbcf0dbc888ba74d83c2421aab2a59be/imdb.yml"
p file = YAML.load(open(url).read)