require './config/environment'

# riase error if user starts a server without migrations
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
# Run parent controller to start an instance of our app
run ApplicationController
