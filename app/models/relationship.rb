class Relationship < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :story, dependent: :destroy
end
