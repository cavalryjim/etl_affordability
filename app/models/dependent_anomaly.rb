# == Schema Information
#
# Table name: dependent_anomalies
#
#  id                 :integer          not null, primary key
#  employee_id        :integer
#  dependent_ssn      :integer
#  plan_name          :string
#  other_stuff        :string
#  enrollment_date    :date
#  disenrollment_date :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lkq_id             :string
#

class DependentAnomaly < ActiveRecord::Base
  belongs_to  :employee
  #belongs_to  :dependent, class_name: "Dependent", foreign_key: "dependent_ssn"
  
  def dependent
    employee.dependents.where(ssn: dependent_ssn).first
  end
end
