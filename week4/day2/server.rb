require 'rack'

app = Proc.new do |env|
  # Finds the num of paragraphs requested, or sets it to 1
  num = env["REQUEST_PATH"].sub(/\/\w+[|\/]/, "")
  num = 1 if num.to_i.zero?

  # Replace the code below with your code (and remove this comment)
  ['200', {'Content-Type' => 'text/html'}, [num.inspect]]

end

Rack::Handler::WEBrick.run app
