class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  # Validations for the user model
  validates :name, presence: true, allow_blank: false
  validates :post_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  ROLES = %i[admin default].freeze

  def admin?
    role == 'admin'
  end

  # A method that returns the 3 most recent posts for a given user.
  def most_recent_post
    Post.order(created_at: :desc).limit(3)
  end
end
