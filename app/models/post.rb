class Post < ApplicationRecord
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :shares, dependent: :destroy
  
  has_many :liking_users, through: :likes, source: :user
  has_many :sharing_users, through: :shares, source: :user
  
  validates :title, presence: true
  validates :content, presence: true
  
  def like_count
    likes.count
  end
  
  def share_count
    shares.count
  end
end 