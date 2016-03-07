class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user

      t.timestamps null: false
    end
  end
end
