# == Schema Information
#
# Table name: dependents
#
#  id          :integer          not null, primary key
#  employee_id :integer
#  ssn         :integer
#  first_name  :string
#  middle_name :string
#  last_name   :string
#  dob         :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Dependent < ActiveRecord::Base
  belongs_to  :employee
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def relationship
    'Dependent'
  end
  
  def display_ssn
    s = ssn.to_s
    "#{s[0,3]}-#{s[3,2]}-#{s[5,4]}"
  end
end
