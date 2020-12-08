class UsersController < ApplicationController

  # GET: /users
  get "/users/login" do
    @error = session[:error_message]
    session.delete(:error_message)
    erb :"/users/login"
  end

  post "/users/login" do
    @user = User.find_by_username(params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      session[:error_message] = "Invalid login attempt"
      redirect "/users/login"
    end
  end

  # GET: /users/new
  get "/users/new" do
    get_errors
    unless @user
      redirect '/login'
    end
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else 
      session[:errors] = @user.errors.full_messages.join(". ")
      redirect "/users/new"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    set_user
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    set_user
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
  private

  def set_user
    @user = User.find_by_id(session[:user_id])
  end

  def get_errors
    @errors = session[:errors]
    session[:errors] = nil
  end
end
