class IngredientsController < ApplicationController

  # GET: /ingredients
  get "/ingredients" do
    set_user
    @ingredients = @user.ingredients
    erb :"/ingredients/index.html"
  end

  # GET: /ingredients/new
  get "/ingredients/new" do
    set_user
    @recipes = @user.recipes
    erb :"/ingredients/new.html"
  end

  # POST: /ingredients
  post "/ingredients" do
    set_user
    binding.pry
    @user.add_ingredient(params[:ingredient])
    redirect "/ingredients"
  end

  # GET: /ingredients/5
  get "/ingredients/:id" do
    set_user
    set_ingredient
    erb :"/ingredients/show.html"
  end

  # GET: /ingredients/5/edit
  get "/ingredients/:id/edit" do
    set_user
    erb :"/ingredients/edit.html"
  end

  # PATCH: /ingredients/5
  patch "/ingredients/:id" do
    redirect "/ingredients/:id"
  end

  # DELETE: /ingredients/5/delete
  delete "/ingredients/:id/delete" do
    set_ingredient
    @ingredient.destroy
    redirect "/ingredients"
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find_by_slug(params[:id])
  end

end
