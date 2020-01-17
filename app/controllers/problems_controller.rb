require './config/environment'

class ProblemsController < ApplicationController
  # CREATE
  # make a get request to '/sessions/new'
  get '/problems/new' do
    @colors = Problem::COLORS
    @grades = Problem::GRADES
    @styles = Style.all
    erb :'problems/new'
  end

  # make a post request to '/problems'
  # controller action to handle post request
  post '/problems' do
    @problem = Problem.new(params[:problem])

    if @problem.save
      #take user to users show page
      redirect "/problems/#{@problem.id}"
    else
      #re-render the form
      redirect '/problems/new'
    end
  end

  # READ
  # Index (all sessions by all users)
  # make get request to '/sessions'
  get '/problems' do
    # display most recent sessions first
    @problems = Problem.all.order('date desc')
    erb :'problems/index'
  end

  # Show (one session)
  # get request to '/session/:id'
  get '/problems/:id' do
    @problem = Problem.find(params[:id])
    erb :"problems/show"
  end

  # UPDATE
  # Edit
  # make a get request to '/sessions/:id/edit'
  get "/problems/:id/edit" do
    # redirect '/login' if !logged_in?
    @problem = Problem.find(params[:id])
    @colors = Problem::COLORS
    @styles = Style.all
    # redirect '/tweets' if current_user != @tweet.user
    erb :"problems/edit_problem"
  end

  # Update
  # make a patch request to '/sessions/:id/''

  # DESTROY
    # Delete
      # make a delete request to '/sessions/:id'

end