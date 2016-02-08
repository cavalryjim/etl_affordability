# == Schema Information
#
# Table name: employees
#
#  id          :integer          not null, primary key
#  ssn         :integer
#  emp_id      :integer
#  first_name  :string
#  middle_name :string
#  last_name   :string
#  dob         :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  lkq_id      :string
#

class Employee < ActiveRecord::Base
  
  has_many  :dependents, dependent: :destroy
  has_many  :coverages, dependent: :destroy
  has_many  :dependent_anomalies, dependent: :destroy
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def relationship
    'Self'
  end
  
  def enrollment_date
    elected = coverages.where(outcome: 'Elected').last 
    if elected.present? && elected.enrollment_date.present?
      elected.enrollment_date
    else
      nil
    end
    #elected.enrollment_date.present? ? elected.enrollment_date : nil
  end
  
  def disenrollment_date
    elected = coverages.where(outcome: 'Elected').last 
    if elected.present? && elected.disenrollment_date.present? 
      elected.disenrollment_date
    else 
      nil
    end
  end
  
  def coverage_names
    coverages.map do |coverage|
      coverage.plan_name
    end
  end
  
  def elected_coverage
    coverages.where(outcome: 'Elected').last
  end
  
  def display_ssn
    s = ssn.to_s
    "#{s[0,3]}-#{s[3,2]}-#{s[5,4]}"
  end
end
