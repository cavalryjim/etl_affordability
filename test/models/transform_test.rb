# == Schema Information
#
# Table name: transforms
#
#  id               :integer          not null, primary key
#  source_file_name :string
#  output_file_name :string
#  ip_address       :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class TransformTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
