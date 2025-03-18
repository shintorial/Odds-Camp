class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.integer :like_count, default: 0
      t.integer :share_count, default: 0
      t.timestamps
    end
  end
end
