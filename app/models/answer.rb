class Answer < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user
  belongs_to :question

  # VALIDATIONS ----------------------------------------------------------------
  validates :num_val,  numericality: { only_integer: true }, allow_nil: true
  validates :bool_val, inclusion: { in: [true, false] }, allow_nil: true
end
