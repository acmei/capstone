class ComingToSession < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :diary

  # VALIDATIONS ----------------------------------------------------------------
  validates :name,  presence: true
  validates :value, presence: true,
                    numericality: { only_integer: true }
end
