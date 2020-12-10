require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_application_secret"
  end

  get "/" do
    set_user
    erb :welcome
  end

  private

  def set_user
    unless @user = User.find_by_id(session[:user_id])
      session[:errors] = "Please Log In"
      redirect "/users/login"
    end
    @user
  end

end
