class AddSalaryToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :salary, :decimal
  end
end
