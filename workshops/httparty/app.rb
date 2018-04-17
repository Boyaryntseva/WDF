require 'httparty'

state = ARGV[0]
city = ARGV[1]

response = HTTParty.get('http://api.wunderground.com/api/023b537b0ab0fdea/conditions/q/' + state + '/' + city+ '.json')
parsed = response.parsed_response
location = parsed['current_observation']['display_location']['full']
time = parsed['current_observation']['local_time_rfc822']
temp_f = parsed['current_observation']['temp_f']
temp_c = parsed['current_observation']['temp_c']

puts "Today is #{time}. Current temperature in #{location} is: #{temp_f} Fahrenheit, which is #{temp_c} Celsius"

if temp_c.to_i < 10
    puts "Seems like spring is not coming this year to #{location}"
else puts "Spring is finally here"
end