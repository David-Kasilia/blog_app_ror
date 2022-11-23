class RemoveColumnsFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_columns(:likes, :authorId, :postId)
  end
end
