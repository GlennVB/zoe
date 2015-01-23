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

class ChatMessage < ActiveRecord::Base
  belongs_to :user
  after_create :broadcast_msg


  def broadcast_msg
    system("echo '#{self.body}' | festival --tts")
  end
end
