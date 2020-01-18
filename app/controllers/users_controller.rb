require './config/environment'

class UsersController < ApplicationController
  # user can sign up
  get '/signup' do
    erb :"users/new"
  end

  post '/signup' do
    user = User.new(params)

    # Won't be saved to db unless user filled out password
    if !user.username || !user.password
      @error = "Error: Please enter a username and password!"
      erb :'/users/new'
    # No existing username
    elsif User.find_by(username: user.username)
      @error = "This username already exists. Please create a new username."
      erb :'/users/new'
    else
      user.save
      session[:user_id] = user.id
      redirect '/problems'
    end
  end

  # users can delete account

  # Helper methods
  helpers do
    def logged_in?
      #check if current_user variable is set
      #!! converts value to boolean
      !!session[:user_id]
    end

    def current_user
      @user = User.find(session[:user_id])
    end
  end
end
