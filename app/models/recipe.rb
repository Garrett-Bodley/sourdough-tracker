class Recipe < ActiveRecord::Base
  include Concerns::Slugify
  extend Concerns::FindBySlug
  has_many :recipes_ingredients
  has_many :ingredients, through: :recipes_ingredients
end
