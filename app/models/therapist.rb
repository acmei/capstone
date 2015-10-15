class Therapist < ActiveRecord::Base
  before_save { email.downcase! }

  # ASSOCIATIONS ---------------------------------------------------------------
  has_secure_password

  # VALIDATIONS ----------------------------------------------------------------
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :name,      presence: true,
                        uniqueness: { case_sensitive: false }
  validates :email,     presence: true,
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
  validates :password,  presence: true, length: { minimum: 6 }
end
