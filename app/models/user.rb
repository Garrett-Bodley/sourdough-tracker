class User < ActiveRecord::Base
  has_many :users_recipes
  has_many :recipes, through: :users_recipes
  has_many :ingredients, through: :recipes
  has_secure_password
  validates :username, uniqueness: :true, presence: :true
  validates :password, presence: :true
end
