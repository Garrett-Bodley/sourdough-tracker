class AddUserIdToBakersPercentagesAndBakes < ActiveRecord::Migration
  def change
    add_column :bakes, :user_id, :integer
    add_column :baker_percentages, :user_id, :integer
  end
end
