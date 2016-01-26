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
#

require 'test_helper'

class DependentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
