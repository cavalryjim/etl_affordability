# == Schema Information
#
# Table name: coverages
#
#  id                 :integer          not null, primary key
#  employee_id        :integer
#  plan_name          :string
#  outcome            :string
#  enrollment_date    :date
#  disenrollment_date :date
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  offer_date         :date
#

class Coverage < ActiveRecord::Base
  belongs_to  :employee
  
  
end
