class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments
    has_many :likes

    # A method that updates the posts counter for a user.
    public    
    def updates_post_counter_user
        author.increment!(:post_counter)
    end

    # A method which returns the 5 most recent comments for a given post.
    public
    def most_recent_comments
        Comment.order(created_at: :desc).limit(5)
    end
end
