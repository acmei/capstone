require 'rails_helper'

RSpec.describe User, type: :model do
  let(:new_user) { create :user }
  let(:nil_name) { build :user, username: nil }
  let(:nil_email) { build :user, email: nil }

  describe "model associations" do
    it { should have_secure_password }
    it { should have_many(:contacts) }
    it { should have_many(:skills) }
    it { should have_many(:diaries) }
    it { should have_many(:answers) }
    it { should have_many(:questions).through(:diaries) }
    it { should belong_to(:therapist) }
  end

  describe "model validations" do
    it "requires a username to be present" do
      expect(nil_name).to be_invalid
      expect(nil_name.errors.keys).to include(:username)
    end

    it "requires username to be unique" do
      create :user
      dup_username = build :user, username: "USER1"

      expect(dup_username).to be_invalid
      expect(dup_username.errors.keys).to include(:username)
    end

    it "requires an email to be present" do
      expect(nil_email).to be_invalid
      expect(nil_email.errors.keys).to include(:email)
    end

    it "valid email must be present - meets regex requirements" do
      valid_emails = %w(user@email.com USER@email.com A_USER@foo.email.org first.last@email.jp)
      valid_emails.each do |valid_email|
        new_user.email = valid_email
        expect(new_user).to be_valid
      end
    end

    it "does not persist invalid emails" do
      invalid_emails = %w(user@email,com user_at_google.org user.name@example name@example..com)
      invalid_emails.each do |invalid_email|
        new_user.email = invalid_email
        expect(new_user).to be_invalid
        expect(new_user.errors.keys).to include(:email)
      end
    end

    it "requires email to be unique" do
      create :user
      dup_email = build :user, email: "EMAIL@example.com"

      expect(dup_email).to be_invalid
      expect(dup_email.errors.keys).to include(:email)
    end

    it "requires password to be present (nonblank)" do
      new_user.password = new_user.password_confirmation = " " * 6

      expect(new_user).to be_invalid
      expect(new_user.errors.keys).to include(:password)
    end

    it "requires password to be at least 6 characters" do
      new_user.password = new_user.password_confirmation = "x" * 5
      
      expect(new_user).to be_invalid
      expect(new_user.errors.keys).to include(:password)
    end
  end
end
