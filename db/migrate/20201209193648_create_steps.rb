class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.string :time
      t.string :note
      t.integer :bake_id
      t.timestamps null: false
    end
  end
end
