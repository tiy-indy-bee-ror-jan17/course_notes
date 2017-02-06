require_relative 'data_parser'

Parse.new.parse_data('planet_express_logs.csv')

puts Parse.weekly_revenue

Parse.pilot_report.each do |message|
  puts message
end

Parse.planet_report.each do |message|
  puts message
end
