class Like < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :posts, class_name: 'Post'
end
