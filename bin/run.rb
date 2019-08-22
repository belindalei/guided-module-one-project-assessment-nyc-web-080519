require_relative '../config/environment'

#puts "hello world"
# CLI.new.run
run
# url = 'https://data.cityofnewyork.us/resource/kpav-sd4t.json'
# response = RestClient.get(url)
# JSON.parse(response)
# binding.pry

JobSeeker.createProfile
