class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :story_id
      t.integer :rating_number

      t.timestamps
    end
  end
end
