class User < ActiveRecord::Base
  has_many :recipes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipes_ingredients, dependent: :destroy
  has_many :bakes, dependent: :destroy
  has_many :baker_percentages, dependent: :destroy
  has_secure_password
  validates :username, uniqueness: :true, presence: :true

  def add_ingredient(ingredient_hash)
    #creates a new ingredient instance associated with the user unless one with the same name exists
    self.ingredients << Ingredient.create(ingredient_hash) unless self.ingredients.any?{|i| i.name.downcase == ingredient_hash[:name].downcase}
  end

  def add_recipe(recipe_hash)
    #creates a new recipe instance associated with the user unless one with the same name exists
    self.recipes << Recipe.create(recipe_hash) unless self.recipes.any?{|r| r.name.downcase == recipe_hash[:name].downcase}
  end

  after_create(:starter_ingredients)

  def starter_ingredients
    self.add_ingredient(name: "Bread Flour", description: "Bread flour, or strong flour is high in gluten protein, between 11.5% and 13.5% protein. The increased protein binds to the flour to entrap carbon dioxide released by the yeast fermentation process, resulting in a stronger rise and more chewy crumb. Bread flour may be made with a hard spring wheat.")
    self.add_ingredient(name: "All Purpose Flour", description: 'All-purpose, or "AP flour", is medium in gluten protein content at around 10.5% to 11.5%. It has adequate protein content for many bread and pizza bases.')
    self.add_ingredient(name: "Starter", description: "A live culture of lactobacilli, acetobacilli, and yeast used as a leavening agent")
    self.add_ingredient(name: "Whole Wheat Flour", description: "Whole wheat flour is made by milling the entire wheatberry. It contains the natural kernel proportions of bran, endosperm and germ. Typically, it is made from hard red wheat.")
    self.add_ingredient(name: "Water", description: "Plain tap water")
    self.add_ingredient(name: "Salt", description: "Regular table salt")
  end
end
