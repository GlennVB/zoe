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
