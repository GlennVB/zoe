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

class UserUpdate < ActiveRecord::Base
  belongs_to :user
  scope :unread, -> { where(read: false) }
end
