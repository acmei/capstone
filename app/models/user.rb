require 'securerandom'
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# accepts 10 digit numbers, delimiters are spaces, dashes, or periods
# see matches at http://rubular.com/r/YqRouzV61l
VALID_PHONE_REGEX = /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)([2-9]1[02-9]‌​|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/
PROVIDERS = ["google_oauth2"]
PASSWORD_EXPIRATION = 3
DEFAULT_QUESTION_IDS = (1..27).to_a

class User < ActiveRecord::Base
  attr_accessor :remember_token, :activation_token, :reset_token

  # ASSOCIATIONS ---------------------------------------------------------------
  has_secure_password
  belongs_to  :photo
  has_many    :contacts
  has_many    :answers
  has_and_belongs_to_many :skills, join_table: :skills_users
  has_and_belongs_to_many :questions, join_table: :questions_users

  # self join - allows user defined as therapist to have many clients
  has_many    :clients,   class_name: 'User',
                          foreign_key: 'therapist_id'
  belongs_to  :therapist, class_name: 'User'

  # CALLBACKS ------------------------------------------------------------------
  before_save   :downcase_email, :format_day
  before_create :create_activation_digest
  after_create  :add_default_questions

  # VALIDATIONS ----------------------------------------------------------------
  validates :name,        presence: true,
                          uniqueness: { case_sensitive: false },
                          length: { minimum: 3, maximum: 20 }
  validates :email,       presence: true,
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }
  validates :phone,       format: { with: VALID_PHONE_REGEX },
                          allow_nil: true
  validates :session_day, inclusion: { in: Date::DAYNAMES }
  validates :provider,    inclusion: { in: PROVIDERS }, allow_nil: true
  validates :activated,   inclusion: { in: [true, false] }

  # SCOPES ---------------------------------------------------------------------
  scope :therapists, -> { where(is_therapist: true) }

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

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  # Sets the password reset attributes
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < PASSWORD_EXPIRATION.hours.ago
  end


  private

    # Sign in with email or name
    def self.find_by_email_or_name(email_or_name)
      user_by_email = User.find_by(email: email_or_name)
      user_by_name = User.find_by(name: email_or_name)

      user = user_by_email || user_by_name
    end

    # OmniAuth
    def self.find_or_create_from_omniauth(auth_hash)
      uid = auth_hash[:uid]
      provider = auth_hash[:provider]

      user = User.where(uid: uid, provider: provider).first_or_initialize
      user.email = auth_hash[:info][:email]
      user.name = auth_hash[:info][:name]
      user.password = SecureRandom.uuid

      return user.save ? user : nil 
    end

    # Add default set of questions to new users
    def add_default_questions
      self.questions << Question.where(id: DEFAULT_QUESTION_IDS)
    end

    # Converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end

    # Formats day to Date::DAYNAME constant elements
    def format_day
      self.session_day = session_day.downcase.capitalize
    end

    # Creates and assigns the activation token and digest
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

end
