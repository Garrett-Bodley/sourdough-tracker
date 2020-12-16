require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
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
    unless current_user
      session[:errors] = "Please Log In"
      redirect "/users/login"
    end
    current_user
  end

  def current_user
    @user ||= User.find_by_id(session[:user_id])
  end

  def get_errors
    @errors = session[:errors]
    session.delete(:errors)
  end

  def sanitize_params(params)
    params.each_value do |value|
      value.gsub!(/<[\/]*[\w]+>/, "") unless value.class != String
    end
  end

end
