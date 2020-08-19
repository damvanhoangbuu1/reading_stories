class Chapter < ApplicationRecord
  belongs_to :story, dependent: :destroy
end
