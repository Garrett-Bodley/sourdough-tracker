class RenameNameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :steps, :name, :action
  end
end
