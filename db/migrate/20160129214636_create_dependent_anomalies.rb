class CreateDependentAnomalies < ActiveRecord::Migration
  def change
    create_table :dependent_anomalies do |t|
      t.integer       :employee_id
      t.integer       :dependent_ssn
      t.string        :plan_name
      t.string        :other_stuff
      t.date          :enrollment_date
      t.date          :disenrollment_date
      t.timestamps null: false
    end
  end
end
