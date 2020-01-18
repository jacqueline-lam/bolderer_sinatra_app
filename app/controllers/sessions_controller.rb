class SessionsController < ApplicationController
# Handles user login and log out

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect '/problems'
    else
      erb :"/users/login"
    end
  end

end