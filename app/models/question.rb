class Question < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  has_many :answers
  has_and_belongs_to_many :diaries, :join_table => "diaries_questions"

  # VALIDATIONS ----------------------------------------------------------------
  validates :text,        presence: true
  validates :category,    presence: true,
                          inclusion: { 
                            in: ["urge", "rating", "drugs/meds", "actions", 
                                "emotions", "optional", "session_urge", 
                                "session_reg"] }
  validates :answer_type, presence: true,
                          inclusion: { in: ["num", "text", "num/text", "bool"] }
end
