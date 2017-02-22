require 'rack'
require 'puma'
require_relative 'app'

# /lipsums - Returns a list of possible lipsums
# /:lipsum - Where :lipsum is the lipsum requested and it should return a paragraph of said lipsum.
# /:lipsum/:num - Should return num paragraphs of said lipsum
# Each of your lipsums should each be in a individual class (and file) and have a class method called call that takes an optional argument of num and returns the lipsum.
# Write integration tests for each of your endpoints.
# Add a /current_time endpoint that returns, well, the current time (nicely and sensibly formatted)
# If a lipsum is requested that isn't supported (or a request is made for something that doesn't exist, say /rhgertht, your server should return a 404 status code and a message of We're sorry. We couldn't that.
# Use the thin webserver instead of WEBrick.
# Add a /current_time/:timezone endpoint that returns the current time in the timezone specified. Also nicely formatted.


Rack::Handler::WEBrick.run App
