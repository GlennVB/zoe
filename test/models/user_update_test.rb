# == Schema Information
#
# Table name: user_updates
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  description :string(255)      default("")
#  icon        :string(255)      default("fa-bell")
#  posted_by   :integer
#  read        :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class UserUpdateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
