class BakerPercentagesController < ApplicationController

  # GET: /recipes/country-loaf/percentages
  get "/recipes/:slug/percentages/new" do
    set_user
    @ingredients = set_recipe.ingredients
    erb :'baker_percentages/new.html'
  end

  get "/recipes/:slug/percentages/edit" do
    set_user
    @ingredients = set_recipe.ingredients
    erb :'baker_percentages/edit.html'
  end

  patch "/recipes/:slug/percentages" do
    set_user
    set_recipe
    
    params[:baker_percentage].each {|percentage| BakerPercentage.update_or_create(percentage)} unless !params[:baker_percentage]
    redirect "/recipes/#{@recipe.slug}"
  end

  post "/recipes/:slug/percentages" do
    set_user
    set_recipe
    params[:baker_percentage].each {|percentage| BakerPercentage.create(percentage)} unless !params[:baker_percentage]
    redirect "/recipes/#{@recipe.slug}"
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_slug(params[:slug])
  end

end
