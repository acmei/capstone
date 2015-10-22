require 'rails_helper'

RSpec.describe Skill, type: :model do

  describe "model associations" do
    it { should have_and_belong_to_many(:users) }
  end

  describe "model validations" do
    it { should validate_presence_of(:category) }

    it do
      should validate_inclusion_of(:category).
        in_array(["mindfulness", "IE", "ER", "DT"])
    end

    it { should validate_presence_of(:text) }

    it "requires text to be unique" do
      create :skill
      dup_text = build :skill, text: "wise mind"

      expect(dup_text).to be_invalid
      expect(dup_text.errors.keys).to include(:text)
    end

    it { should validate_presence_of(:description) }

    it "requires description to be unique" do
      create :skill
      dup_description = build :skill, description: "This is a description"

      expect(dup_description).to be_invalid
      expect(dup_description.errors.keys).to include(:description)
    end
  end
end
