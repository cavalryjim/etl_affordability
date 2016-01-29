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
  
  def coverage_names
    coverages.map do |coverage|
      coverage.plan_name
    end
  end
  
  def display_ssn
    s = ssn.to_s
    "#{s[0,3]}-#{s[3,2]}-#{s[5,4]}"
  end
end
