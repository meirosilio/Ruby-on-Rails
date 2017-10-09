class Post < ApplicationRecord
  belongs_to :user



  validates :post_title,
      presence: true,
      length: {maximum: 142}

  validates :post_content,
      presence: true

end
