require 'bundler'
# require 'rest-client'
# require 'json'
# require 'text-table'
# require 'colorize'
# require 'rspec'



Bundler.require
#require '../app/models/open_job.rb'
#Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db', :timeout  => 1000)
require_all 'lib'


