class RenameNameColumn < ActiveRecord::Migration
  def change
    rename_column :steps, :name, :action
  end
end
