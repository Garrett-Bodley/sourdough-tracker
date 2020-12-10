class BakerPercentage < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  def self.update_or_create(hash)
    unless found = self.find_by(ingredient_id: hash[:ingredient_id], recipe_id: hash[:recipe_id])
      self.create(hash)
    end
    found.update(hash)
  end
end
