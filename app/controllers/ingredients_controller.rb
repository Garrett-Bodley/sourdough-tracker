class IngredientsController < ApplicationController

  # GET: /ingredients
  get "/ingredients" do
    @ingredients = set_user.ingredients
    erb :"/ingredients/index.html"
  end

  # GET: /ingredients/new
  get "/ingredients/new" do
    @recipes = set_user.recipes
    erb :"/ingredients/new.html"
  end

  # POST: /ingredients
  post "/ingredients" do
    set_user.add_ingredient(params[:ingredient])
    redirect "/ingredients"
  end

  # GET: /ingredients/5
  get "/ingredients/:id" do
    set_user
    @recipes = set_ingredient.recipes
    erb :"/ingredients/show.html"
  end

  # GET: /ingredients/5/edit
  get "/ingredients/:id/edit" do
    set_user
    @recipes = set_ingredient.recipes
    erb :"/ingredients/edit.html"
  end

  # PATCH: /ingredients/5
  patch "/ingredients/:id" do
    set_ingredient.update(params[:ingredient])
    redirect "/ingredients/:id"
  end

  # DELETE: /ingredients/5/delete
  delete "/ingredients/:id/delete" do
    set_ingredient.destroy
    redirect "/ingredients"
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find_by_slug(params[:id])
  end

end
