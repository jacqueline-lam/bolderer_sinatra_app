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

    get '/sessions' do
      @sessions = Session.all
      erb :'sessions/index'
    end

    # Show (one session)
    # get request to '/session/:id'
    get '/sessions/:id' do
      @session = Session.find(params[:id])
      erb :'sessions/show'
    end

  # UPDATE
    # Edit
      # make a get request to '/sessions/:id/edit'
    # update
      # make a patch request to '/sessions/:id/''

  # DESTROY
    # Delete
      # make a delete request to '/sessions/:id'

end
