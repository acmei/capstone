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
                                "session_reg", "session", "skill"] }
  validates :answer_type, presence: true,
                          inclusion: { in: ["num", "text", "num/text", "bool"] }
  validates :recurrence,  presence: true,
                          numericality: { only_integer: true },
                          inclusion: { in: [1, 7] }

  # SCOPES ---------------------------------------------------------------------
  scope :category, -> (category) { where(category: category) }
  scope :daily, -> { where(recurrence: 7) }
  scope :once, -> { where(recurrence: 1) }
  scope :response, -> (answer_type) { where(answer_type: answer_type) }

end
