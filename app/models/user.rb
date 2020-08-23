class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :ratings, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: {maximum: Settings.NAME_MAXIMUM}
  validates :email, presence: true, length: { maximum: Settings.EMAIL_MAXIMUM },
    format: { with: VALID_EMAIL_REGEX },uniqueness: true
  validates :password, presence: true, length: { minimum: Settings.PASSWORD_MINIMUM }, allow_nil: true

  has_secure_password

  enum role: {user: 0, converter: 1, admin: 2}

  after_initialize do
    self.role ||= :user if new_record?
  end
end
