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
  # Index (all problems by all users)
  # make get request to '/problems'
  get '/problems' do
    # display most recent problems first
    @problems = Problem.all.order('date desc')
    erb :'problems/index'
  end

  # Show (one problem)
  # get request to '/problems/:id'
  get '/problems/:id' do
    @problem = Problem.find(params[:id])
    erb :"problems/show"
  end

  # UPDATE
  # Edit
  # make a get request to '/problems/:id/edit'
  # renders view edit_problem.erb
  get "/problems/:id/edit" do
    # redirect '/login' if !logged_in?
    @problem = Problem.find(params[:id])
    @colors = Problem::COLORS
    @styles = Style.all
    # redirect '/problems' if current_user != @tweet.user
    erb :"problems/edit_problem"
  end

  # Update
  # make a patch request to '/problems/:id/''
  # find instnace of the model to update,
  # using id from params, update and save instance
  patch "/problems/:id" do
    @problem = Problem.find(params[:id])
    @problem.update(params[:problem])
    redirect "problems/#{@problem.id}"
  end

  # DESTROY
  # make a delete request to '/problems/:id'
  delete "/problems/:id/delete" do
    problem = Problem.find_by_id(params[:id])
    if problem && problem.destroy
      redirect '/problems'
    else
      redirect "/problesm/#{params[:id]}"
    end
  end

end