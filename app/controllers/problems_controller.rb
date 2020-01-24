require './config/environment'

# Use ApplicationController as an inheritance point
# to inherit all defaults and helper methods
class ProblemsController < ApplicationController
  # READ -  Index Action (all problems by all users)
  # make get request to '/problems'
  get '/problems' do
    redirect '/login' unless logged_in?
    @user = current_user
    @users_and_problem_count = Problem.users_and_problem_count
    @best_climber = Problem.problems_sorted_by_grade.first.user

    @problems = Problem.problems_by_date
    erb :'problems/index'
  end

  # CREATE
  # Shows 'new problem' form and makes a new problem
  get '/problems/new' do
    redirect '/login' if !logged_in?
    problem_attr
    erb :'problems/new'
  end

  post '/problems' do
    problem = current_user.problems.new(params[:problem])
    if problem.style_ids.empty?
      @error = "Data invalid. Please select at least one style."
      problem_attr
      erb :"/problems/new"
    else
      # persist problem object to db
      if problem.save
        #take user to problem show page
        redirect "/problems/#{problem.id}"
      else
        #re-render the form
        redirect '/problems/new'
      end
    end
  end

  # READ - Show Action (one problem)
  # get request to '/problems/:id'
  get '/problems/:id' do
    redirect '/login' if !logged_in?
    @problem = Problem.find(params[:id])
    erb :"problems/show"
  end

  # UPDATE - Edit
  # make a get request to '/problems/:id/edit'
  # renders view edit_problem.erb
  get "/problems/:id/edit" do
    redirect '/login' if !logged_in?
    @problem = Problem.find(params[:id])
    # User authorization - only the user who created the problem can edit it
    redirect '/problems' if current_user != @problem.user
    problem_attr
    erb :"problems/edit_problem"
  end

  # make a patch request to '/problems/:id/''
  # find instance of the model to update,
  # using id from params, update and save instance
  patch "/problems/:id" do
    @problem = Problem.find(params[:id])
    # styles must be selected
    if params[:problem].include?("style_ids")
      @problem.update(params[:problem])
      redirect "/problems/#{@problem.id}"
    else
      @error = true
      problem_attr
      erb :"/problems/edit_problem"
    end
  end

  # DESTROY
  # make a delete request to '/problems/:id'
  delete "/problems/:id/delete" do
    problem = Problem.find_by_id(params[:id])
    if current_user == problem.user
      if problem && problem.delete
        redirect "/users/#{problem.user_id}"
      else
        redirect "/problems/#{params[:id]}"
      end
    else
      redirect '/problems'
    end
  end

  private
    def problem_attr
      @colors = Problem::COLORS
      @grades = Problem::GRADES
      @styles = Style.all
    end
end