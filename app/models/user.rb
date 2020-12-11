class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipes_ingredients, dependent: :destroy
  has_many :bakes, dependent: :destroy
  has_many :baker_percentages, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: :true, presence: :true
  validates :password, presence: :true

  def add_ingredient(ingredient_hash)
    #creates a new ingredient instance associated with the user unless one with the same name exists
    self.ingredients << Ingredient.create(ingredient_hash) unless self.ingredients.any?{|i| i.name == ingredient_hash[:name]}
  end

  def add_recipe(recipe_hash)
    #creates a new recipe instance associated with the user unless one with the same name exists
    self.recipes << Recipe.create(recipe_hash) unless self.recipes.any?{|r| r.name == recipe_hash[:name]}
  end

  def add_recipe_and_ingredient(params)
    #checks to see if user already has a recipe or ingredient of the same name
    if self.ingredients.any?{|i| i.name == params[:ingredient][:name]} || self.recipes.any?{|r| r.name == params[:recipe][:name]}
      return false
    else
      #creates new ingredient and recipe and associates them with one another
      self.add_ingredient(params[:ingredient])
      self.add_recipe(params[:recipe])
      self.recipes.last.ingredients << self.ingredients.last
    end
  end

  after_create(:starter_ingredients)

  def starter_ingredients
    self.ingredients << Ingredient.create(name: "Bread Flour", description: "Flour with a higher than average protein content")
    self.ingredients << Ingredient.create(name: "Starter", description: "A live culture of lactobacilli, acetobacilli, and yeast used as a leavening agent")
    self.ingredients << Ingredient.create(name: "Whole Wheat Flour", description: "Milled from the entire wheat berry. It absorbs more water and can make the dough stickier when handling")
    self.ingredients << Ingredient.create(name: "Water", description: "Plain tap water")
    self.ingredients << Ingredient.create(name: "Salt", description: "Regular table salt")
  end
end
