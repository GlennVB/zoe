# == Schema Information
#
# Table name: ideas
#
#  id          :integer          not null, primary key
#  name        :string(255)      default("")
#  description :text             default("")
#  completed   :boolean          default(FALSE)
#  user_id     :integer
#  published   :boolean          default(FALSE)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
