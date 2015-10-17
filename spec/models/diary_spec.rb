require 'rails_helper'

RSpec.describe Diary, type: :model do
  let(:new_diary) { create :diary }

  describe "model associations" do
    it { should belong_to(:user) }
    it { should have_many(:skills) }
    it { should have_many(:answers).through(:user) }
    it { should have_and_belong_to_many(:questions) }
  end

  describe "model validations" do
    it { should validate_presence_of(:times_filled) }

    it "requires times_filled to be an integer" do
      valid_times_filled = %w(7 1 0 3)
      valid_times_filled.each do |valid_times_filled|
        new_diary.times_filled = valid_times_filled
        expect(new_diary).to be_valid
      end
    end

    it "does not persist invalid times_filled" do
      invalid_times_filled = %w(1.5 -2 -0.5)
      invalid_times_filled.each do |invalid_times_filled|
        new_diary.times_filled = invalid_times_filled
        expect(new_diary).to be_invalid
        expect(new_diary.errors.keys).to include(:times_filled)
      end
    end
  end
end
