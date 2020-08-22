class Category < ApplicationRecord
  has_many :stories, dependent: :destroy

  scope :order_by_created_at, ->{order(created_at: :DESC)}
end
