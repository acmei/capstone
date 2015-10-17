class Skill < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  belongs_to :user
  belongs_to :diary

  # VALIDATIONS ----------------------------------------------------------------
  validates :category,    presence: true,
                          inclusion: { in: ["mindfulness", "IE", "ER", "DT"] }
  validates :text,        presence: true,
                          uniqueness: { case_sensitive: false }
  validates :acronym,     uniqueness: { case_sensitive: false }
  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }
end
