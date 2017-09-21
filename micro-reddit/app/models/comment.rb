class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :author_name, presence: true
  validates :comment_body, presence: true
end
