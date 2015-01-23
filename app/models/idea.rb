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

class Idea < ActiveRecord::Base
  belongs_to :user
  scope :published, -> { where(published: true) }
  scope :completed, -> { where(completed: true) }
  
  before_save :check_completed
  
  def check_completed
    if self.completed_changed?
      if self.completed
        self.user.add_update("Good job, completed #{self.name}", "fa-lightbulb-o")
      end
    end
  end
end
