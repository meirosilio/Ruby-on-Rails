class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  before_save :email_downcase


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\-.]+\.[a-z]+\z/i

  has_secure_password
  PASSWORD_VALIDATOR = /((?:(?=.*[a-z])(?=.*[A-Z])(?=.*\W)|
                        (?=.*\d)(?=.*[A-Z])(?=.*\W)|
                        (?=.*\d)(?=.*[a-z])(?=.*\W)|
                        (?=.*\d)(?=.*[a-z])(?=.*[A-Z])).*)/x
  validates :name,
            presence: true,
            length: {maximum: 25}

  validates :email,
      presence: true,
      length: {maximum: 255},
      format: {with: VALID_EMAIL_REGEX},
      uniqueness: {case_sensitive: false}

  validates :password,
      presence: true,
      length: {minimum: 8},
      format: {
          with: PASSWORD_VALIDATOR,
          message: "must contain: a lowercase letter, an uppercase letter, a digit, a non-word character or symbol"}

  private
  def email_downcase
    self.email= email.downcase
  end


end
