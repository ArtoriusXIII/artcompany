class AddVacationDaysToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :vacation_days, :integer
  end
end
