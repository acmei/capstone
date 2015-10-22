class Contact < ActiveRecord::Base
  # accepts 10 digit numbers, delimiters are spaces, dashes, or periods
  # see it on Rubular: http://rubular.com/r/LizMJwd3T0
  VALID_PHONE_REGEX = /(?:(?:\+?1\s*(?:[.-]\s*)?)?(?:(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]‌​)\s*)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?)([2-9]1[02-9]‌​|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})/

  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user

  # VALIDATIONS ----------------------------------------------------------------
  validates :name,  presence: true
  validates :phone, presence: true,
                    format: { with: VALID_PHONE_REGEX }
end
