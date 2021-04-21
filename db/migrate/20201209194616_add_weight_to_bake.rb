class AddWeightToBake < ActiveRecord::Migration[6.1]
  def change
    add_column :bakes, :weight, :integer
  end
end
