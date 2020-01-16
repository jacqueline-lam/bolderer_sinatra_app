require './config/environment'

class ProblemsController < ApplicationController
  # CREATE
  # make a get request to '/sessions/new'
  get '/problems/new' do
    @colors = ["white", "red", "orange", "yellow", "green", "lime", "blue", "pink", "purple", "black"]
    # @styles = ["dyno", "crimps", "jugs", "slopers", "pinches", "body tension", "compressions", "powerful", "overhang", "dihedral", "slab"]
    # @styles = Style.all
    erb :'problems/new'
  end

  # make a post request to '/problems'
  # controller action to handle post request
  post '/problems' do
    @problem = Problem.new
    @problem.date = params[:problem][:date]
    @problem.color = params[:problem][:color]
    @problem.grade = params[:problem][:grade]
    @problem.image = params[:problem][:image]
    # @problem.styles = params[:problem][:styles]
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
    # update
      # make a patch request to '/sessions/:id/''

  # DESTROY
    # Delete
      # make a delete request to '/sessions/:id'

end