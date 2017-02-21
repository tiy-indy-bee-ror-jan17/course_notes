require_relative 'person'

class App

  attr_accessor :env, :path

  def initialize(env)
    @env = env
    @path = env["PATH_INFO"]
    # puts env.inspect
  end

  def response
    if Array(env["HTTP_USER_AGENT"]).detect{|agent| agent.include? "Googlebot"}
      go_away_google
    elsif path.split("/").length == 3
      say_name
    elsif path == "/env"
      output_env
    elsif path == "/poster" && env["REQUEST_METHOD"] == "POST"
      posterize
    else
      four_oh_four
    end
  end

  def go_away_google
    ['401', headers, ["Go away, Google"]]
  end

  def say_name
    ['200', headers, ["Hello, #{Person.find path.split("/").last}"]]
  end

  def four_oh_four
    ['404', headers, ["That ain't here"]]
  end

  def output_env
    ['200', headers, env.inspect]
  end

  def posterize
    body = env["rack.input"].read
            .split("&")
            .collect{|field| URI.unescape field.split("=").last}
            .join(" ")
    ['200', headers, body]
  end

  def headers
    {'Content-Type' => 'text/html'}
  end

  def self.call(env)
    new(env).response
  end

end
