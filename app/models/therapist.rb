class Therapist < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token
  before_save :downcase_email
  before_create :create_activation_digest

  # ASSOCIATIONS ---------------------------------------------------------------
  has_secure_password
  has_many :users

  # VALIDATIONS ----------------------------------------------------------------
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # accepts 10 digit numbers, delimiters are spaces, dashes, or periods
  VALID_PHONE_REGEX = /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)([2-9]1[02-9]‌​|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/
  
  validates :name,      presence: true,
                        uniqueness: { case_sensitive: false }
  validates :email,     presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  validates :phone,     presence: true,
                        format: { with: VALID_PHONE_REGEX }                      
  validates :password,  presence: true, length: { minimum: 6 }

  # METHODS --------------------------------------------------------------------
  # Returns the hash digest of the given string
  def Therapist.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token
  def Therapist.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = Therapist.new_token
    update_attribute(:remember_digest, Therapist.digest(remember_token))
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

  private

    # Converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest
    def create_activation_digest
      self.activation_token  = Therapist.new_token
      self.activation_digest = Therapist.digest(activation_token)
    end

    # Remembers a user in the database for use in persistent sessions.
    def remember
      self.remember_token = Therapist.new_token
      update_attribute(:remember_digest, Therapist.digest(remember_token))
    end
end
