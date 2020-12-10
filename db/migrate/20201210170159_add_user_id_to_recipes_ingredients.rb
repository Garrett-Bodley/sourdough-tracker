class AddUserIdToRecipesIngredients < ActiveRecord::Migration
  def change
    add_column :recipes_ingredients, :user_id, :integer
  end
end
