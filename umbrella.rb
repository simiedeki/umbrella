require "http"
require "json"

pp "What's your location"
location=gets.chomp 

# Hidden variables
gmaps = ENV["GMAPS_KEY"]

# Assemble the full URL string by adding the first part, the API token, and the last part together
gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + location + "&key=" + gmaps

# Place a GET request to the URL
raw_gmaps = HTTP.get(gmaps_url)

parsed_gmaps = JSON.parse(raw_gmaps)

results_hash = parsed_gmaps.fetch("results")

geometry = results_hash.fetch("geometry")
location = geometry.fetch("location")
lat=location.fetch("lat")
lng=location.fetch("lng")


# Hidden variables
pirate_weather_api_key = ENV["PIRATE_WEATHER_KEY"]

# Assemble the full URL string by adding the first part, the API token, and the last part together
pirate_weather_url = "https://api.pirateweather.net/forecast/" + pirate_weather_api_key + "/" + lng.to_s "," + lat.to_s

# Place a GET request to the URL
raw_weather = HTTP.get(pirate_weather_url)


parsed_weather = JSON.parse(raw_response)

currently_hash = parsed_response.fetch("currently")

current_temp = currently_hash.fetch("temperature")
puts "It is currently #{current_temp}°F."
