require 'rails_helper'

RSpec.describe Diary, type: :model do
  describe "model associations" do
    it { should belong_to(:user) }
    it { should have_many(:skills) }
    it { should have_many(:answers).through(:user) }
    it { should have_and_belong_to_many(:questions) }
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
