class SessionsController < ApplicationController
# Handles user login and log out

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/problems'
    else
      @error = true
      erb :"/users/login"
    end
  end

  # Users can log out
  get '/logout' do
    session.clear
    redirect '/'
  end
end