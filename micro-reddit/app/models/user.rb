class User < ApplicationRecord

  has_many :posts
  has_many :comments

  before_save {
    self.email = self.email.downcase
    self.username = self.username.downcase
  }

  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank:false, uniqueness: {case_sensitive: false}
  validates :username, presence: true , allow_blank: false, uniqueness: {case_sensitive: false}
  validates :password, presence: true, allow_blank: false, length: {minimum: 6}

end
