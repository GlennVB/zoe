# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  key        :string(255)
#  user_id    :integer
#  status     :string(255)
#  open       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ApiKey < ActiveRecord::Base
  belongs_to :user
end
