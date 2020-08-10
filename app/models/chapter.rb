class Chapter < ApplicationRecord
  belongs_to :story, dependent: :delete_all
end
