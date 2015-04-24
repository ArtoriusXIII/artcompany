class AddDepartmentToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :department, :text
  end
end
