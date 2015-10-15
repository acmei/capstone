class Contact < ActiveRecord::Base
  before_save { email.downcase! }

  # ASSOCIATIONS ---------------------------------------------------------------
  has_secure_password
  belongs_to :user

  # VALIDATIONS ----------------------------------------------------------------
  VALID_PHONE_REGEX = ^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$

  validates :name,  presence: true
  validates :phone, presence: true,
                    format: { with: VALID_PHONE_REGEX }
end
