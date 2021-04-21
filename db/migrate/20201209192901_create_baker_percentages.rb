class CreateBakerPercentages < ActiveRecord::Migration[6.1]
  def change
    create_table :baker_percentages do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.float :percentage
      t.timestamps null: false
    end
  end
end
