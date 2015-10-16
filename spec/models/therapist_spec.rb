require 'rails_helper'

RSpec.describe Therapist, type: :model do
  let(:new_therapist) { create :therapist}

  describe "model associations" do
    it { should have_secure_password }
    it { should have_many(:users) }
  end

  describe "model validations" do
    it { should validate_presence_of(:name) }

    it "requires name to be unique" do
      create :therapist
      dup_name = build :therapist, name: "Dr. Fox Mulder"

      expect(dup_name).to be_invalid
      expect(dup_name.errors.keys).to include(:name)
    end

    it { should validate_presence_of(:email) }

    it "valid email must be present - meets regex requirements" do
      valid_emails = %w(user@email.com USER@email.com A_USER@foo.email.org first.last@email.jp)
      valid_emails.each do |valid_email|
        new_therapist.email = valid_email
        expect(new_therapist).to be_valid
      end
    end

    it "does not persist invalid emails" do
      invalid_emails = %w(user@email,com user_at_google.org user.name@example name@example..com)
      invalid_emails.each do |invalid_email|
        new_therapist.email = invalid_email
        expect(new_therapist).to be_invalid
        expect(new_therapist.errors.keys).to include(:email)
      end
    end

    it "requires email to be unique" do
      create :therapist
      dup_email = build :therapist, email: "EMAIL@email.com"

      expect(dup_email).to be_invalid
      expect(dup_email.errors.keys).to include(:email)
    end

    it "requires password to be present (nonblank)" do
      new_therapist.password = new_therapist.password_confirmation = " " * 6

      expect(new_therapist).to be_invalid
      expect(new_therapist.errors.keys).to include(:password)
    end

    it "requires password to be at least 6 characters" do
      new_therapist.password = new_therapist.password_confirmation = "x" * 5
      
      expect(new_therapist).to be_invalid
      expect(new_therapist.errors.keys).to include(:password)
    end
  end
end
