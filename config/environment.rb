require 'bundler'
require 'rest-client'
require 'json'

Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

url = 'https://data.cityofnewyork.us/resource/kpav-sd4t.json'
response = RestClient.get(url)
JSON.parse(response)
