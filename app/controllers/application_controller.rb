require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :password_secret, "bolder_password_security"
  end

  get "/" do
    erb :index
  end

end
