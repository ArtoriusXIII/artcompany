class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :address1
      t.string :address2
      t.text :comments
      t.string :details
      t.references :employee, index: true, foreign_key: true

      t.timestamps null: false
    end
     add_foreign_key :accounts, :employees
  end
end
