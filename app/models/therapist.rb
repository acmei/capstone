class Therapist < ActiveRecord::Base
  before_save { email.downcase! }

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
end
