class User < ApplicationRecord
  has_many :stories, dependent: :delete_all
  has_many :relationships, dependent: :delete_all
  has_many :ratings, dependent: :delete_all

  enum role: {user: 0, converter: 1, admin: 2}

  after_initialize do
    self.role ||= :user if new_record?
  end
end
