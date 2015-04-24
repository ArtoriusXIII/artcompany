class AddDateOfHireToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :date_of_hire, :datetime
  end
end
