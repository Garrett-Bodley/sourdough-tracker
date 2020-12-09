class CreateBakes < ActiveRecord::Migration
  def change
    create_table :bakes do |t|
      t.string :date
      t.integer :recipe_id
      t.timestamps null: false
    end
  end
end
