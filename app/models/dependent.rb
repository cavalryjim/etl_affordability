# == Schema Information
#
# Table name: dependents
#
#  id           :integer          not null, primary key
#  employee_id  :integer
#  ssn          :integer
#  first_name   :string
#  middle_name  :string
#  last_name    :string
#  dob          :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  relationship :string
#  lkq_id       :string
#

class Dependent < ActiveRecord::Base
  belongs_to  :employee
  #has_many    :dependent_anomalies, class_name: "DependentAnomaly", primary_key: "ssn"
  
  def name
    "#{first_name} #{last_name}"
  end
  
  # def relationship
  #   'Dependent'
  # end
  
  def display_ssn
    if ssn.present?
      s = ssn.to_s
      "#{s[0,3]}-#{s[3,2]}-#{s[5,4]}"
    end
  end
  
  def anomaly
    if ssn.present?
      employee.dependent_anomalies.where(dependent_ssn: ssn).last 
    else
      employee.dependent_anomalies.where(lkq_id: lkq_id).last
    end
  end
  
  def enrollment_date
    if anomaly.present? && anomaly.enrollment_date.present?
      anomaly.enrollment_date
    #coverage = employee.coverages.where(outcome: 'Elected').last 
    elsif covered? #coverage.present? && coverage.plan_name.includes?("Family")
      employee.enrollment_date
    else
      nil
    end
  end
  
  def disenrollment_date
    if anomaly.present? && anomaly.disenrollment_date.present?
      anomaly.disenrollment_date
    elsif covered? #coverage.present? &&
      employee.disenrollment_date
    else
      nil
    end
  end
  
  def elected_coverage
    employee.elected_coverage
  end
  
  def elected_plan_name
    if elected_coverage.present? && elected_coverage.plan_name.present?
      elected_coverage.plan_name.strip
    else
      nil
    end
  end
  
  def elected_outcome
    if elected_coverage.present? && elected_coverage.outcome.present?
      elected_coverage.outcome
    else
      nil
    end
  end
  
  def covered?
    coverage = employee.coverages.where(outcome: 'Elected').last 
    return false unless (coverage.present? && coverage.plan_type.present?)
    
    if (relationship == "Spouse") && coverage.plan_type.downcase.include?('family'||'spouse') 
      return true
    end
    
    if (relationship == "Dependent") && coverage.plan_type.downcase.include?('family'||'child') 
      return true
    end
  end
end
