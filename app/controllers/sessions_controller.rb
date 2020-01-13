require './config/environment'

class SessionsController < ApplicationController
  # CREATE
    # New
    # make a get request to '/sessions/new'

    # Create
    # make a post request to '/sessions'

  # READ
    # Index (all sessions)
    # make get request to '/sessions'

    # Show (one session)
    # get request to '/session/:id'

  # UPDATE
    # Edit
      # make a get request to '/sessions/:id/edit'
    # update
      # make a patch request to '/sessions/:id/''

  # DESTROY
    # Delete
      # make a delete request to '/sessions/:id'

end
