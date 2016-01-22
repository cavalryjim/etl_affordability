class RenameEnrollmentField < ActiveRecord::Migration
  def change
    rename_column :coverages, :enrollemnt_date, :enrollment_date
  end
end
