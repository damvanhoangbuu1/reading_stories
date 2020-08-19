class User < ApplicationRecord
  has_many :stories, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :ratings, dependent: :destroy

  enum role: {user: 0, converter: 1, admin: 2}

  after_initialize do
    self.role ||= :user if new_record?
  end
end
