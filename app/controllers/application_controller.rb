require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_application_secret"
  end

  get "/" do
    erb :welcome
  end

  private

  def set_user
    unless @user = User.find_by_id(session[:user_id])
      session[:errors] = "Please Log In"
      redirect "/users/login"
    end
  end

end
