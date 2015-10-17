require 'rails_helper'

RSpec.describe Contact, type: :model do
  let(:new_contact) { create :contact }

  describe "model associations" do
    it { should belong_to(:user) }
  end

  describe "model validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }

    it "requires a valid phone number to be present - meets regex requirements" do
      valid_phone = ["382-302-2302," "234.567.8901", "1 234 567-8901", "1-234-567-8901 ext1234"]
      valid_phone.each do |valid_phone|
        new_contact.phone = valid_phone
        expect(new_contact).to be_valid
      end
    end

    it "does not persist invalid phone numbers" do
      invalid_phone = ["555-5555-555", "1-392-329392", "1-800-HOTLINE", "+1 392 393 2039"]
      invalid_phone.each do |invalid_phone|
        new_contact.phone = invalid_phone
        expect(new_contact).to be_invalid
        expect(new_contact.errors.keys).to include(:phone)
      end
    end
  end
end
