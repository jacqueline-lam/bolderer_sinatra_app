require './config/environment'

class SessionsController < ApplicationController
  # CREATE
    # New
    # make a get request to '/sessions/new'
    get '/sessions/new' do
      erb :"sessions/new"
    end

    # Create
    # make a post request to '/sessions'
    # controller action to handle post request
    post '/sessions' do
      session = Session.new(params)
      if session.save
        #take user to users show page
        redirect "/problems/new"
      else
        #re-render the form
        redirect '/sessions/new'
      end
    end

  # READ
    # Index (all sessions by all users)
    # make get request to '/sessions'
    get '/sessions' do
      # display most recent sessions first
      @sessions = Session.all.order('date desc')
      erb :'sessions/index'
    end

    # Show (one session)
    # get request to '/session/:id'
    get '/sessions/:id' do
      @session = Session.find(params[:id])
      @problems = @session.problems
      # @problems = Problem.find_by(session_id: params[:id])
      # binding.pry

      erb :"sessions/show"
    end

  # UPDATE
    # Edit
      # make a get request to '/sessions/:id/edit'
    # update
      # make a patch request to '/sessions/:id/''

  # DESTROY
    # Delete
      # make a delete request to '/sessions/:id'

  # HELPER METHODS
  helpers do
    def current_session
      Session.find(session[:session_id])
    end

  end
end
