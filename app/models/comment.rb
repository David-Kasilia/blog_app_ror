class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :posts, class_name: 'Post'
end
