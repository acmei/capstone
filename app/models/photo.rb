class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :therapist

  # VALIDATIONS ----------------------------------------------------------------
  validates :link,  presence: true
end
