class Answer < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user
  belongs_to :question

  # VALIDATIONS ----------------------------------------------------------------
  validates :num,   numericality: { only_integer: true, greater_than_or_equal_to: 0 }, 
                    allow_nil: true
  validates :bool,  inclusion: { in: [true, false] }, allow_nil: true 
end
