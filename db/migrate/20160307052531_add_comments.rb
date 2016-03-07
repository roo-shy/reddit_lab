class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    t.integer :post_id
    t.text :comment_text
    t.string :user

    t.timestamps null: false
  end
  end
end
