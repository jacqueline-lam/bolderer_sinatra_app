require './config/environment'

# Inherit from Sinatra::Base and
# define the HTTP interface for our application
class ApplicationController < Sinatra::Base

  # tells controller where to find views and public directory
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable app to use sessions keyword to access session hash
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
      !!current_user
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def ranking_color(rank)
      case rank
      when 1
        return "#F8695A"
      when 2
        return "#DE5853"
      when 3
        return "#D55251"
      when 4
        return "#CB4C4E"
      when 5
        return "#C0454B"
      else
        return "#FFFFFF"
      end
    end
  end
end
