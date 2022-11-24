class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :posts, class_name: 'Post'
    
    # A method that updates the comments counter for a post.
    def updates_comments_counter_post
        posts.increment!(:comments_counter)
    end
end
