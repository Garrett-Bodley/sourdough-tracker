class UsersController < ApplicationController

  # GET: /users
  get "/users/login" do
    get_success_msg
    get_errors
    erb :"/users/login.html"
  end

  delete "/users/logout" do
    session.clear
    session[:success_msg] = "Succesfully Logged Out"
    redirect "/users/login"
  end

  post "/users/login" do
    unless @user = User.find_by_username(params[:username])
      session[:errors] = "Invalid login attempt"
      redirect "/users/login"
    end
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
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    if /\W/.match?(params[:user][:username])
      session[:errors] = "Usernames can only use letters and underscore"
      redirect "users/new"
    end
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
    session[:success_msg] = "Account Updated!"
    redirect "/users/#{@user.id}"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    set_user.destroy
    session[:success_msg] = "Account Deleted"
    redirect "/users/login"
  end

  private

  def get_success_msg
    @success = session[:success_msg]
    session.delete(:success_msg)
  end
end
