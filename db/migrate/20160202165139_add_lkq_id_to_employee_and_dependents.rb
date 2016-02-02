class AddLkqIdToEmployeeAndDependents < ActiveRecord::Migration
  def change
    add_column :dependents, :lkq_id, :string
    add_column :employees, :lkq_id, :string
    add_column :dependent_anomalies, :lkq_id, :string
  end
end
