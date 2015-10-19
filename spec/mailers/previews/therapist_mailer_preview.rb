# Preview all emails at http://localhost:3000/rails/mailers/therapist_mailer
class TherapistMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/therapist_mailer/account_activation
  def account_activation
    TherapistMailer.account_activation
  end

  # Preview this email at http://localhost:3000/rails/mailers/therapist_mailer/password_reset
  def password_reset
    TherapistMailer.password_reset
  end

end
