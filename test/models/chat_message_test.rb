# == Schema Information
#
# Table name: chat_messages
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class ChatMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
