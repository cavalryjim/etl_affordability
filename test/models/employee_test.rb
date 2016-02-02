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

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
