class BakerPercentage < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :user

  def self.update_or_create(hash)
    unless found = self.find_by(ingredient_id: hash[:ingredient_id], recipe_id: hash[:recipe_id], user_id: hash[:user_id])
      self.create(hash)
    else
      found.update(hash)
    end
  end
end
