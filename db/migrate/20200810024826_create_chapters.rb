class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.integer :chapter_number
      t.string :name
      t.text :content
      t.integer :story_id

      t.timestamps
    end
  end
end
