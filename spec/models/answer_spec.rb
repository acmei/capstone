require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:new_answer) { create :answer }

  describe "model associations" do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
  end

  describe "model validations" do

    it "requires num_val to be an integer >= 0 || nil" do
      valid_num_val = [7, 1, 0, 3, nil]
      valid_num_val.each do |valid_num_val|
        new_answer.num_val = valid_num_val
        expect(new_answer).to be_valid
      end
    end

    it "does not persist invalid num_val" do
      invalid_num_val = [1.5, -2, -0.5]
      invalid_num_val.each do |invalid_num_val|
        new_answer.num_val = invalid_num_val
        expect(new_answer).to be_invalid
        expect(new_answer.errors.keys).to include(:num_val)
      end
    end
  end
end
