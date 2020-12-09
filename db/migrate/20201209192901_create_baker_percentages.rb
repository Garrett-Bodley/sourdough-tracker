class CreateBakerPercentages < ActiveRecord::Migration
  def change
    create_table :baker_percentages do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.float :percentage
      t.timestamps null: false
    end
  end
end
