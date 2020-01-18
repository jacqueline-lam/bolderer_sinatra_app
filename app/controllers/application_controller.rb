require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "session_cookie_encryption"
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
      !!User.find_by(id: session[:user_id])
    end

    def current_user
      User.find_by(id: session[:user_id])
    end
  end
end
