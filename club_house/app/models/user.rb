class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  before_save :email_downcase


  attr_accessor :remember_token


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


  #Return the hash digest of the given string
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #Return a rendom token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #return true if the given token matches the hash digest
  def cookie_authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  def email_downcase
    self.email= email.downcase
  end


end
