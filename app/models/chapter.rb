class Chapter < ApplicationRecord
  belongs_to :story, dependent: :destroy

  scope :order_by_created_at, ->{order(created_at: :DESC)}
  scope :where_story_id, ->(story_id){where(story_id: story_id)}

  def next_chapter
    if chapter_number < story.chapters.count
      story.chapters.find_by(chapter_number: chapter_number + 1)
    else
      self
    end
  end

  def previos_chapter
    if chapter_number > 1
      story.chapters.find_by(chapter_number: chapter_number - 1)
    else
      self
    end
  end
end
