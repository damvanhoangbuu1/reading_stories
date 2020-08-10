class Rating < ApplicationRecord
  belongs_to :user, dependent: :delete_all
  belongs_to :story, dependent: :delete_all
end
