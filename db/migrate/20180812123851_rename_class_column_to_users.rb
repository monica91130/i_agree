class RenameClassColumnToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :class, :profession
  end
end
