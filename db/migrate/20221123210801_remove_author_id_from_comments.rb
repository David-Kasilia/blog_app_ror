class RemoveAuthorIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_columns(:comments, :authorId, :postId)
  end
end
