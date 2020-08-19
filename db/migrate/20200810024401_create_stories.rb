class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :author
      t.integer :user_id
      t.text :description
      t.string :img
      t.boolean :free
      t.integer :price
      t.integer :status
      t.integer :views
      t.integer :category_id

      t.timestamps
    end
  end
end
