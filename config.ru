require './config/environment'

# riase error if user starts a server without migrations
if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# Access Sinatra Middleware's functionality
# Allows us to use PATH PUT DELETE requests
use Rack::MethodOverride
# Mount subsequent controllers
use ProblemsController
use SessionsController
use UsersController
# Run parent controller to start an instance of our app
# that can respond to requests from a client
run ApplicationController
