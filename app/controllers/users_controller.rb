require './config/environment'

class UsersController < ApplicationController
  # user can sign up
  get '/signup' do
    redirect "/users/#{current_user.id}" if logged_in?
    erb :"users/new"
  end

  post '/signup' do
    user = User.new(params)

    # Won't be saved to db unless user filled out password
    if !user.username || !user.password
      @error = "Please enter a username and password!"
      erb :'/users/new'
    # Check if there is an existing username
    elsif User.find_by(username: user.username)
      @error = "This username already exists. Please create a new username."
      erb :'/users/new'
    else
      user.save
      session[:user_id] = user.id
      redirect '/problems'
    end
  end

  get '/users/:id' do
    redirect '/' if !logged_in?
    @user = User.find_by(id: params[:id])
    @problems = @user.problems
    erb :"/users/show"
  end
end
