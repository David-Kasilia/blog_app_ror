class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :posts, class_name: 'Post'

  # A method that updates the likes counter for a post.
  def updates_likes_counter_post
    posts.increment!(:likes_counter)
  end
end
