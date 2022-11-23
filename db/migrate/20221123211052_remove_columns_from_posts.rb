class RemoveColumnsFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column(:posts, :authorId)
  end
end
