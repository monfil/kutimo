class User < ApplicationRecord
	before_save { email.downcase! }
  validates :name,      presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email,     presence: true, length: { maximum: 50 }, 
  											format: { with: VALID_EMAIL_REGEX },
  											uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  belongs_to :group
  has_many :user_goals
  has_many :goals, :through => :user_goals
  has_many :user_rewards
  has_many :rewards, :through => :user_rewards
  has_one :vulgarity
end
