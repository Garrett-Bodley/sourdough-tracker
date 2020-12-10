class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    @recipes = set_user.recipes
    erb :"/recipes/index.html"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    @ingredients = set_user.ingredients
    erb :"/recipes/new.html"
  end

  # POST: /recipes
  post "/recipes" do
    set_user.add_recipe(params[:recipe])
    redirect "/recipes/#{@user.recipes.last.slug}/percentages/new"
  end

  # GET: /recipes/country-loaf/percentages/edit
  get "recipes/:slug/percentages/edit" do
    set_user
    set_recipe
    erb :'/recipes/percentages/edit.html'
  end

  # GET: /recipes/country-loaf
  get "/recipes/:slug" do
    set_user
    set_recipe
    erb :"/recipes/show.html"
  end

  # GET: /recipes/country-loaf/edit
  get "/recipes/:slug/edit" do
    @ingredients = set_user.ingredients
    set_recipe
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/country-loaf
  patch "/recipes/:slug" do
    set_recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.slug}"
  end

  # DELETE: /recipes/country-loaf/delete
  delete "/recipes/:slug/delete" do
    set_recipe.destroy
    redirect "/recipes"
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_slug(params[:slug])
  end

end
