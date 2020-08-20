class Chapter < ApplicationRecord
  belongs_to :story, dependent: :destroy

  scope :order_by_created_at, -> { order(created_at: :DESC)}
end
