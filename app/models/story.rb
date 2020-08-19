class Story < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :relationships, dependent: :destroy
  belongs_to :category, dependent: :destroy

  enum status: {paused: 0, updating: 1, finished: 2}

  after_initialize do
    self.status ||= :updating if new_record?
  end
end
