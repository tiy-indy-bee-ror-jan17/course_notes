require 'rack'
require_relative 'app'

# app = Proc.new do |env|
#   path = env["PATH_INFO"]
#   headers = {'Content-Type' => 'text/html'}
#   if path.split("/").length == 3
#     ['200', headers, ["Hello, #{path.split("/").last}"]]
#   elsif path == "/env"
#     ['200', headers, [env.inspect]]
#   else
#     ['404', headers, ["That ain't here"]]
#   end
# end

app = App

Rack::Handler::WEBrick.run app
