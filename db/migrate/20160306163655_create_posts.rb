class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :link, unique: true, null: false
      t.integer :view_count, default: 0
      t.string :title
      t.string :submitted_by
      t.string :photo_url

      t.timestamps null: false
    end
  end
end
