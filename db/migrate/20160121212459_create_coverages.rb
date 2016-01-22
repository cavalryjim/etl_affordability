class CreateCoverages < ActiveRecord::Migration
  def change
    create_table :coverages do |t|
      t.integer       :employee_id
      t.string        :plan_name
      t.string        :outcome
      t.date          :enrollemnt_date
      t.date          :disenrollment_date
      
      t.timestamps null: false
    end
  end
end
