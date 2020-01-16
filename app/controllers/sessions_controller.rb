 require './config/environment'

class SessionsController < ApplicationController
  # CREATE
    # New
    # make a get request to '/sessions/new'
    get '/sessions/new' do
      @colors = ["white", "red", "orange", "yellow", "green", "lime", "blue", "pink", "purple", "black"]
      @styles = ["dyno", "crimps", "slopers", "pinches", "body tension", "compressions", "powerful", "overhang", "dihedral", "slab"]
      # @styles = Style.all
      erb :'sessions/new'
    end

    # Create
    # make a post request to '/sessions'
    # controller action to handle post request
    post '/sessions' do

    end

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
      @problems = Problem.find_by(session_id: params[:id])
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
