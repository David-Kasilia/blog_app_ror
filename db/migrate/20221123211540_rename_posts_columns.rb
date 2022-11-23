class RenamePostsColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column(:posts, :commentsCounter, :comments_counter)
    rename_column(:posts, :likesCounter, :likes_counter)
  end
end
