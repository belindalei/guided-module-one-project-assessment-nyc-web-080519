require 'bundler'
require 'rest-client'
require 'json'
require 'text-table'


Bundler.require
#require '../app/models/open_job.rb'
#Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


