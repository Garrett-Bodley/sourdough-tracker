class Ingredient < ActiveRecord::Base
  include Concerns::Slugify
  extend Concerns::FindBySlug
  has_many :recipes_ingredients, dependent: :destroy
  has_many :baker_percentages, dependent: :destroy
  has_many :recipes, through: :recipes_ingredients
  belongs_to :user
end
