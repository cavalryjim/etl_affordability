class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer     :ssn
      t.integer     :emp_id
      t.string      :first_name
      t.string      :middle_name
      t.string      :last_name
      t.date        :dob
      
      t.timestamps null: false
    end
  end
end
