class CreateUsersRecipes < ActiveRecord::Migration
  def change
    create_table :users_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.timestamps null: false
    end
  end
end
