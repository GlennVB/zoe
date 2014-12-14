# == Schema Information
#
# Table name: api_keys
#
#  id         :integer          not null, primary key
#  alias      :string(255)
#  key        :string(255)
#  status     :string(255)      default("Open")
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class ApiKey < ActiveRecord::Base
  belongs_to :user
  

end
