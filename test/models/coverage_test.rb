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
#  plan_type          :string
#

require 'test_helper'

class CoverageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
