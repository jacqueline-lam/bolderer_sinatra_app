require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# Mount subsequent controller
# access middleware's functionality
# middleware that allows us to use PATH PUT DELETE requests
use Rack::MethodOverride
use ProblemsController
use SessionsController
# use UserController
# Run parent controller
run ApplicationController
