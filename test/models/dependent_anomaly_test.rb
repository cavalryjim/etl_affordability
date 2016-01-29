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
#

require 'test_helper'

class DependentAnomalyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
