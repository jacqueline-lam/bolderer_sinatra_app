# Connect up all files to the appripriate gems

ENV['SINATRA_ENV'] ||= "development"

# Requires all gems in Gemfile. and app directory
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

# Tells AR where database is located
# establish connection using AR gem to our SQLite through database
# sets name of db management system to hold date
# sets path to app's database
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
