class Bake < ActiveRecord::Base
  belongs_to :recipe
  has_many :ingredients, through: :recipe
  has_many :steps
  belongs_to :user
end
