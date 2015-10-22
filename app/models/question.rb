class Question < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  has_many :answers
  has_and_belongs_to_many :users, join_table: :questions_users

  # VALIDATIONS ----------------------------------------------------------------
  validates :text,        presence: true
  validates :category,    presence: true,
                          inclusion: { 
                            in: ["urge", "rating", "drugs/meds", "actions", 
                                "emotions", "optional", "session_urge", 
                                "session_reg", "skill"] }
  validates :answer_type, presence: true,
                          inclusion: { in: ["num", "text", "num/text", "bool"] }
  validates :recurrence,  presence: true,
                          numericality: { only_integer: true },
                          inclusion: { in: [1, 7] }
end
