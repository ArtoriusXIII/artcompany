class Account < ActiveRecord::Base
  belongs_to :employee, :foreign_key => "employee_id"
  
end
