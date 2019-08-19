require_relative '../config/environment'

puts "hello world"

# url = 'https://data.cityofnewyork.us/resource/kpav-sd4t.json'
# response = RestClient.get(url)
# JSON.parse(response)
# binding.pry

JobSeeker.createProfile
