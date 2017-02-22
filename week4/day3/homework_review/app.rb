require_relative 'standard'
require_relative 'samuel'
require_relative 'hipster'

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
    parts = env['PATH_INFO'].split("/").reject{|a| a == ""}
    @params = {
      controller: parts[0],
      id: parts[1],
      others: parts[2..-1]
    }
  end

  def response
    if params[:controller] == "lipsums"
      ['200', headers, ["Please pick between standard, samuel, and hipster"]]
    elsif %w(standard samuel hipster).include? params[:controller].downcase
      ['200', headers, [Object.const_get(params[:controller].capitalize).call(params[:id])]]
    elsif params[:controller] == "current_time"
      ['200', headers, [Time.now.strftime("%A, %d %b %Y %l:%M %p")]]
    else
      ['404', headers, ["We're sorry. We couldn't that."]]
    end
  end

  def headers
    {'Content-Type' => 'text/html'}
  end


end
