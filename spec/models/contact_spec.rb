require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "model associations" do
    it { should belong_to(:user) }
  end

  # describe "model validations" do
  #   it { should validate_presence_of(:text) }
  #   it { should validate_presence_of(:category) }

  #   it do
  #     should validate_inclusion_of(:category).
  #       in_array(["urge", "rating", "drugs/meds", "actions", 
  #                 "emotions", "optional", "session_urge", "session_reg"])
  #   end

  #   it { should validate_presence_of(:answer_type) }

  #   it do
  #     should validate_inclusion_of(:answer_type).
  #       in_array(["num", "text", "num/text", "bool"])
  #   end
  # end
end
