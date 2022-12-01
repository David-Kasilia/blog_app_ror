class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the comments counter for a post.
  after_save :updates_comments_counter_post

  def updates_comments_counter_post
    post.increment!(:comments_counter)
  end
end
