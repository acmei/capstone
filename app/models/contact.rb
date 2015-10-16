class Contact < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user

  # VALIDATIONS ----------------------------------------------------------------
  VALID_PHONE_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/

  validates :name,  presence: true
  validates :phone, presence: true,
                    format: { with: VALID_PHONE_REGEX }
end
