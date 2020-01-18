require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "session cookie encryption"
    enable :sessions
  end

  get "/" do
    erb :index
  end

  # Helper methods
  helpers do
    def logged_in?
      #check if current_user variable is set
      #!! converts value to boolean
      # use session to determine the definition of being logged in
      # !!session[:user_id]
      !!User.find_by(id: session[:user_id])
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
  end
end
