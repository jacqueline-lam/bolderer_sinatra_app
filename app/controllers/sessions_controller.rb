class SessionsController < ApplicationController
# Handles user login and log out

  get '/login' do
    redirect "/users/#{current_user.id}" if logged_in?
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    # authenticate method turns user's password input into a hash
    # and compare it w/ hashed password stored in database
    if user && user.authenticate(params[:password])
      # Storing user_id key in session hash
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      @error = "Invalid username or password. Please try again."
      erb :"/users/login"
    end
  end

  # Users can log out
  get '/logout' do
    redirect '/' if !logged_in?
    session.clear
    redirect '/'
  end
end