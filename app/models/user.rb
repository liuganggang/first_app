class User < ActiveRecord::Base
  # attr_accessor :name, :emall

  has_many :microposts

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :emall, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  before_save { emall.downcase! }

  has_secure_password
  validates :password, length: { minimum: 6 }
end
