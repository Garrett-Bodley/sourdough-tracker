class User < ActiveRecord::Base
  has_many :recipes
  has_many :ingredients
  has_secure_password
  validates :username, uniqueness: :true, presence: :true
  validates :password, presence: :true

end
