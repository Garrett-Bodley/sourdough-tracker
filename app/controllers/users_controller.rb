class UsersController < ApplicationController

  # GET: /users
  get "/users/login" do
    get_success_msg
    get_errors
    erb :"/users/login"
  end

  delete "/users/logout" do
    session.clear
    session[:success_msg] = "Logged Out"
    redirect "/users/login"
  end

  post "/users/login" do
    @user = User.find_by_username(params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      session[:errors] = "Invalid login attempt"
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
      session[:errors] = @user.errors.full_msgs.join(". ")
      redirect "/users/new"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    get_success_msg
    set_user
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    set_user
    get_errors
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    set_user
    unless @user.authenticate(params[:old_password])
      session[:errors] = "Incorrect Password Given"
      redirect "/users/#{@user.id}/edit"
    end
    unless @user.update(params[:user])
      session[:errors] = "New Password fields must match"
      redirect "/users/#{@user.id}/edit"
    end
    session[:success_msg] = "Password Updated!"
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
  private

  def set_user
    unless @user = User.find_by_id(session[:user_id])
      session[:errors] = "Please Log In"
      redirect "/users/login"
    end
  end

  def get_success_msg
    @success = session[:success_msg]
    session.delete(:success_msg)
  end

  def get_errors
    @errors = session[:errors]
    session.delete(:errors)
  end
end
