class AddUserIdToRecipesIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes_ingredients, :user_id, :integer
  end
end
