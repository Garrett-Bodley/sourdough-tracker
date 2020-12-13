class BakerPercentagesController < ApplicationController

  # GET: /recipes/country-loaf/percentages
  get "/recipes/:slug/percentages/new" do
    @ingredients = set_recipe.ingredients
    erb :'baker_percentages/new.html'
  end

  get "/recipes/:slug/percentages/edit" do
    @ingredients = set_recipe.ingredients
    erb :'baker_percentages/edit.html'
  end

  patch "/recipes/:slug/percentages" do
    set_recipe
    params[:baker_percentage].each {|percentage| BakerPercentage.update_or_create(percentage) unless !params[:baker_percentage]}
    redirect "/recipes/#{@recipe.slug}"
  end

  post "/recipes/:slug/percentages" do
    set_recipe
    params[:baker_percentage].each {|percentage| BakerPercentage.create(percentage)} unless !params[:baker_percentage]
    redirect "/recipes/#{@recipe.slug}"
  end

  private

  def set_recipe
    @recipe = Recipe.find_by_slug_and_user_id(slug: params[:slug], user_id: set_user.id)
  end

end
