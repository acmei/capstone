require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:user) { create :user }
    let(:mail) { UserMailer.account_activation(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("DBT Companion Account Activation")
      expect(mail.to).to eq(["email1@example.com"])
      expect(mail.from).to eq(["noreply@dbtcompanion.com"])
    end
  end

  describe "password_reset" do
    let(:user) { create :user }
    let(:mail) { UserMailer.password_reset(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("DBT Companion Password Reset")
      expect(mail.to).to eq(["email2@example.com"])
      expect(mail.from).to eq(["noreply@dbtcompanion.com"])
    end
  end

end
