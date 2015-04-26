class Employee < ActiveRecord::Base
    has_one :account 
end
