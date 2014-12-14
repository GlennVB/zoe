# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  player_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
