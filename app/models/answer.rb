class Answer < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user
  belongs_to :question

  # VALIDATIONS ----------------------------------------------------------------
  validates :num_val, numericality: { 
                        only_integer: true, 
                        greater_than_or_equal_to: 0 
                      }, 
                      allow_nil: true
end
