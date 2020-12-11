require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_application_secret"
  end

  get "/" do
     if set_user
      redirect "/users/#{@user.id}"
     else
      redirect "/users/login"
     end
  end

  private

  def set_user
    unless @user = User.find_by_id(session[:user_id])
      session[:errors] = "Please Log In"
      redirect "/users/login"
    end
    @user
  end

  def get_errors
    @errors = session[:errors]
    session.delete(:errors)
  end

end
