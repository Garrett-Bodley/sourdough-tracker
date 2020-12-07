class Ingredient < ActiveRecord::Base
  include Concerns::Slugify
  extend Concerns::FindBySlug
  has_many :recipes_ingredients
  has_many :recipes, through: :recipes_ingredients
end
