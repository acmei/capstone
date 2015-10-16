class Diary < ActiveRecord::Base

  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user

  # VALIDATIONS ----------------------------------------------------------------
  validates :filled_in_session, inclusion: { in: [true, false] }
  validates :times_filled,      presence: true,
                                numericality: { only_integer: true }
end
