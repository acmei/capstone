class Answer < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :question
  belongs_to :user

  # VALIDATIONS ----------------------------------------------------------------
  validates :num_val,  numericality: { only_integer: true }
  validates :bool_val, inclusion: { in: [true, false] }
end
