class Story < ApplicationRecord
  has_many :chapters, dependent: :delete_all
  has_many :ratings, dependent: :delete_all
  has_many :relationships, dependent: :delete_all
  belongs_to :category, dependent: :delete_all

  enum status: {paused: 0, updating: 1, finished: 2}

  after_initialize do
    self.status ||= :updating if new_record?
  end
end
