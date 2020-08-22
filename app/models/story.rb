class Story < ApplicationRecord
  has_many :chapters, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :relationships, dependent: :destroy
  belongs_to :category, dependent: :destroy

  enum status: {paused: 0, updating: 1, finished: 2}

  scope :hot_stories, ->{order(views: :DESC).limit(13)}
  scope :order_by_updated_at, ->{order(updated_at: :DESC)}
  scope :order_by_views, ->{order(views: :DESC)}
  scope :search_by_name_or_author, lambda{|term|
    order(updated_at: :DESC) if term.blank?
    where("name LIKE :search OR author LIKE :search", search: "%#{term}%") if term.present?
  }                                   

  after_initialize do
    self.status ||= :updating if new_record?
  end

  def first_chap
    chapters.first
  end
end
