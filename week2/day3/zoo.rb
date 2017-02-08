files = Dir.entries("./lib").reject{|path| path[0] == "."}

files.each do |file|
  require_relative "lib/#{file}"
end
