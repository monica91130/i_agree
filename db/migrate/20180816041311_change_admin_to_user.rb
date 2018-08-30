class ChangeAdminToUser < ActiveRecord::Migration[5.2]

  def up
    change_column :Users, :admin, :boolean
  end

  def down
    change_column :Users, :admin, :boolean, null: false, default: false
  end
  
end
