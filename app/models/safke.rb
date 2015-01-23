# == Schema Information
#
# Table name: safkes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Safke < ActiveRecord::Base
  belongs_to :user
end
