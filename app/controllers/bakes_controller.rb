class BakesController < ApplicationController

  # GET: /bakes
  get "/bakes" do
    @bakes = set_user.bakes
    erb :"/bakes/index.html"
  end

  # GET: /bakes/new
  get "/bakes/new" do
    @recipes = set_user.recipes
    erb :"/bakes/new.html"
  end

  # POST: /bakes
  post "/bakes" do
    bake = Bake.create(params[:bake])
    redirect "/bakes/#{bake.id}"
  end

  patch "/bakes/:id" do
    get_bake.update(params[:bake])
    redirect "/bakes/#{@bake.id}"
  end

  # GET: /bakes/5
  get "/bakes/:id" do
    set_user
    @recipe = get_bake.recipe
    erb :"/bakes/show.html"
  end

  # GET: /bakes/5/edit
  get "/bakes/:id/edit" do
    @recipes = set_user.recipes
    get_bake
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
    @bake = Bake.find(params[:id])
  end

end
