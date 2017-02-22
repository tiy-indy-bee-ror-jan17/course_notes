class App

  attr_accessor :env, :params

  def initialize(env)
    @env = env
    define_params
  end

  def self.call(env)
    new(env).response
  end

  def define_params
    parts = env['REQUEST_PATH'].split("/").reject{|a| a == ""}
    @params = {
      controller: parts[0],
      id: parts[1],
      others: parts[2..-1]
    }
  end

  def response
    if params[:controller] == "lipsums"
      ['200', headers, ["Pick between standard, samuel and hipster"]]
    elsif %w(standard samuel hipster).include? controller.downcase
      ['200', headers, [Object.const_get(controller.capitalize).call(params[:id])]]
    end
  end

  def headers
    {'Content-Type' => 'text/html'}
  end


end
