# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  full_name              :string(255)      default("")
#  username               :string(255)      default("")
#  theme_preference       :string(255)      default("skin-blur-blue")
#  profile                :text
#  avatar                 :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable, :lockable, :timeoutable
  has_many :api_keys
  has_many :user_updates
  has_many :ideas
  has_many :games, through: :players
  has_many :players
  mount_uploader :avatar, AvatarUploader
  
  def add_update(description, icon)
    self.user_updates.create(description: description, icon: icon)
  end
  
  def to_s
    return self.username != "" ? self.username : self.email
  end
end
