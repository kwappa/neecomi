class CreateBlogContents < ActiveRecord::Migration
  def change
    create_table :blog_contents do |t|
      t.integer :user_id
      t.string :title
      t.string :slug
      t.text :body
      t.datetime :published_at
      t.timestamps null: false
    end

    add_index :blog_contents, :user_id
    add_index :blog_contents, :published_at
    add_index :blog_contents, [:user_id, :slug], unique: true
  end
end
