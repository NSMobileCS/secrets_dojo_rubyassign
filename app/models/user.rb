class User < ActiveRecord::Base
  has_secure_password

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, presence: true, length: { in: 2..40 }
  validates :email, presence: true, length: { in: 2..40 }, format: { with: EMAIL_REGEX }

  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret

  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
