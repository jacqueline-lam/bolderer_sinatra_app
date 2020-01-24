require './config/environment'

# Inherit from Sinatra::Base and
# define the HTTP interface for our application
class ApplicationController < Sinatra::Base

  # tells controller where to find views and public directory
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

    def ranking_color(rank)
      if rank == 1
        return "#F8695A"
      elsif rank == 2
        return "#DE5853"
      elsif rank == 3
        return "#D55251"
      elsif rank == 4
        return "#CB4C4E"
      elsif rank == 5
        return "#C0454B"
      else
        return "#FFFFFF"
      end
    end
  end
end
