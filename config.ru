responsible for loading our application environment, code, and libraries
require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# Mount subsequent controllers
# Telling Rack that part of my web app is defined within the following class
# access middleware's functionality
# middleware that allows us to use PATH PUT DELETE requests
use Rack::MethodOverride
use ProblemsController
use SessionsController
use UsersController
# Run parent controller
run ApplicationController
