class Skill < ActiveRecord::Base
  # ASSOCIATIONS ---------------------------------------------------------------
  has_and_belongs_to_many :users, join_table: :skills_users

  # VALIDATIONS ----------------------------------------------------------------
  validates :text,        presence: true,
                          uniqueness: { case_sensitive: false }
  validates :category,    presence: true,
                          inclusion: { in: ["mindfulness", "IE", "ER", "DT"] }
  validates :description, presence: true,
                          uniqueness: { case_sensitive: false }

  # SCOPES ---------------------------------------------------------------------
  scope :category, -> (category) { where(category: category) }
end
