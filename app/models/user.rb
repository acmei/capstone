require 'securerandom'

class User < ActiveRecord::Base
  attr_accessor :remember_token
  before_save { self.email.downcase! }

  # ASSOCIATIONS ---------------------------------------------------------------
  has_secure_password
  belongs_to :therapist
  has_many :contacts
  has_many :skills
  has_many :diaries
  has_many :answers
  has_many :questions, through: :diaries

  # VALIDATIONS ----------------------------------------------------------------
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username,  presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 20 }
  validates :email,     presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  validates :password,  presence: true, length: { minimum: 6 }

  # QUERYING answers for user
  # User.first.diaries.first.questions &:answers

  # METHODS --------------------------------------------------------------------
  # Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end

  # OmniAuth
  def self.find_or_create_from_omniauth(auth_hash)
    uid = auth_hash[:uid]
    provider = auth_hash[:provider]

    user = User.where(uid: uid, provider: provider).first_or_initialize
    user.email = auth_hash[:info][:email]
    user.username = auth_hash[:info][:name]
    user.password = SecureRandom.uuid

    return user.save ? user : nil 
  end
end
