class Recipe < ActiveRecord::Base
  has_many :recipes_ingredients
  has_many :ingredients, through: :recipes_ingredients
end
