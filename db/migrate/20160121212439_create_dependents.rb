class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.integer     :employee_id
      t.integer     :ssn
      t.string      :first_name
      t.string      :middle_name
      t.string      :last_name
      t.date        :dob
      t.timestamps null: false
    end
  end
end
