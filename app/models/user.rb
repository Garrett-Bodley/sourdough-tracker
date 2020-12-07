class User < ActiveRecord::Base
  has_many :users_recipes
  has_many :recipes, through: :users_recipes
  has_many :ingredients, through: :recipes
  has_secure_password
  validates :username, :password, presence: :true
end
