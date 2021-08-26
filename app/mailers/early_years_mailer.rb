class EarlyYearsMailer < Mail::Notify::Mailer
  STANDARD_EMAIL_TEMPLATE = "e2c26677-797d-481c-abaf-8d3fafa315b0".freeze

  def send_early_years_email(recipients)
    template_mail(STANDARD_EMAIL_TEMPLATE, to: recipients)
  end
end
