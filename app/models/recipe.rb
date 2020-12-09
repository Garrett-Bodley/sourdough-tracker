class Recipe < ActiveRecord::Base
  include Concerns::Slugify
  extend Concerns::FindBySlug
  has_many :recipes_ingredients
  has_many :baker_percentages
  has_many :bakes
  has_many :ingredients, through: :recipes_ingredients
  belongs_to :user
end
