class CreateSteps < ActiveRecord::Migration[6.1]
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
