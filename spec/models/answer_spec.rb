require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:new_answer) { create :answer }

  describe "model associations" do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

  describe "model validations" do

    it "requires num to be an integer >= 0 || nil" do
      valid_num = [7, 1, 0, 3, nil]
      valid_num.each do |valid_num|
        new_answer.num = valid_num
        expect(new_answer).to be_valid
      end
    end

    it "does not persist invalid num" do
      invalid_num = [1.5, -2, -0.5]
      invalid_num.each do |invalid_num|
        new_answer.num = invalid_num
        expect(new_answer).to be_invalid
        expect(new_answer.errors.keys).to include(:num)
      end
    end
  end
end
