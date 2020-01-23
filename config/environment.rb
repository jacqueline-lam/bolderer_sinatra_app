# Connect up all files to the appripriate gems

ENV['SINATRA_ENV'] ||= "development"

# Loads bundler hence all gems in Gemfile. and app directory
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'
