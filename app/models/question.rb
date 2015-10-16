class Question < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  has_many :answers
  has_and_belongs_to_many :diaries, :join_table => "diaries_questions"

  # VALIDATIONS ----------------------------------------------------------------
  validates :text,        presence: true,
                          uniqueness: { case_sensitive: false }
  validates :category,    presence: true,
                          inclusion: { in: ["urge", "rating", "drugs/meds", "actions", "emotions", "optional"] }
  validates :answer_type, presence: true,
                          inclusion: { in: ["num", "text", "bool"] }
end
