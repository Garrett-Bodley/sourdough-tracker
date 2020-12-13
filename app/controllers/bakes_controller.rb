class BakesController < ApplicationController

  # GET: /bakes
  get "/bakes" do
    @bakes = set_user.bakes
    erb :"/bakes/index.html"
  end

  # GET: /bakes/new
  get "/bakes/new" do
    get_errors
    @recipes = set_user.recipes
    erb :"/bakes/new.html"
  end

  # POST: /bakes
  post "/bakes" do
    if params[:bake][:recipe_id] == "..." || params[:bake][:weight].empty?
      session[:errors] = "Please fill out every field"
      redirect "/bakes/new"
    end
    bake = Bake.create(sanitize_params(params[:bake]))
    redirect "/bakes/#{bake.id}"
  end

  patch "/bakes/:id" do
    get_bake.update(sanitize_params(params[:bake]))
    redirect "/bakes/#{@bake.id}"
  end

  # GET: /bakes/5
  get "/bakes/:id" do
    @recipe = get_bake.recipe
    erb :"/bakes/show.html"
  end

  # GET: /bakes/5/edit
  get "/bakes/:id/edit" do
    @recipes = get_bake.user.recipes
    erb :"/bakes/edit.html"
  end

  # PATCH: /bakes/5
  patch "/bakes/:id" do
    redirect "/bakes/:id"
  end

  # DELETE: /bakes/5/delete
  delete "/bakes/:id/delete" do
    redirect "/bakes"
  end

  private

  def get_bake
    @bake = Bake.find_by(id: params[:id], user_id: set_user.id)
  end

end
