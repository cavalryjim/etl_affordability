class AddIndexesOnEmployeeId < ActiveRecord::Migration
  def change
    add_index :dependents, :employee_id
    add_index :coverages, :employee_id
  end
end
