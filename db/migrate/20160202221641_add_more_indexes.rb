class AddMoreIndexes < ActiveRecord::Migration
  def change
    add_index :dependent_anomalies, :employee_id
    
  end
end
