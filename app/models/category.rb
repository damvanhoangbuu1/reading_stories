class Category < ApplicationRecord
  has_many :stories, dependent: :delete_all
end
