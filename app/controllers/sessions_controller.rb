class SessionsController < ApplicationController
# Handles user login and log out

  get '/login' do
    redirect "/users/#{current_user.id}" if logged_in?
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      #storing user_id key in session hash
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      @error = true
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