class RenameNameInEmployeesToFirstName < ActiveRecord::Migration
  def change
    rename_column :employees, :name, :first_name
  end
end
