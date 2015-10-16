class Diary < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user
  has_many :skills
  has_and_belongs_to_many :questions, join_table: :diaries_questions
  has_many :answers, through: :questions

  # VALIDATIONS ----------------------------------------------------------------
  validates :filled_in_session, inclusion: { in: [true, false] }
  validates :times_filled,      presence: true,
                                numericality: { only_integer: true }
end
