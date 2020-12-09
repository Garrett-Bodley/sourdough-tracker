class AddWeightToBake < ActiveRecord::Migration
  def change
    add_column :bakes, :weight, :integer
  end
end
