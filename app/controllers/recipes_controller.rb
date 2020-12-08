class RecipesController < ApplicationController

  # GET: /recipes
  get "/recipes" do
    set_user
    @recipes = Recipe.all
    erb :"/recipes/index.html"
  end

  # GET: /recipes/new
  get "/recipes/new" do
    set_user
    erb :"/recipes/new.html"
  end

  # POST: /recipes
  post "/recipes" do
    redirect "/recipes"
  end

  # GET: /recipes/5
  get "/recipes/:id" do
    set_user
    erb :"/recipes/show.html"
  end

  # GET: /recipes/5/edit
  get "/recipes/:id/edit" do
    set_user
    erb :"/recipes/edit.html"
  end

  # PATCH: /recipes/5
  patch "/recipes/:id" do
    redirect "/recipes/:id"
  end

  # DELETE: /recipes/5/delete
  delete "/recipes/:id/delete" do
    redirect "/recipes"
  end

end
