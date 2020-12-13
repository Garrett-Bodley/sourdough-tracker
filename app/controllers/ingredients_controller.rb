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
    set_user.add_ingredient(sanitize_params(params[:ingredient]))
    redirect "/ingredients"
  end

  # GET: /ingredients/5
  get "/ingredients/:slug" do
    @recipes = set_ingredient.recipes
    erb :"/ingredients/show.html"
  end

  # GET: /ingredients/5/edit
  get "/ingredients/:slug/edit" do
    @recipes = set_ingredient.user.recipes
    erb :"/ingredients/edit.html"
  end

  # PATCH: /ingredients/5
  patch "/ingredients/:slug" do
    set_ingredient.update(sanitize_params(params[:ingredient]))
    redirect "/ingredients/#{@ingredient.slug}"
  end

  # DELETE: /ingredients/5/delete
  delete "/ingredients/:slug/delete" do
    set_ingredient.destroy
    redirect "/ingredients"
  end

  private

  def set_ingredient
    if @ingredient = Ingredient.find_by_slug_and_user_id(slug: params[:slug], user_id: set_user.id)
      return @ingredient
    else
      redirect "/ingredients"
    end
  end

end
