class RenameNameEmployees < ActiveRecord::Migration
  def change
    rename_column :table, :Name, :First_name
  end
end
