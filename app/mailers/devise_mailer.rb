class DeviseMailer < Devise::Mailer
  STANDARD_EMAIL_TEMPLATE = "e2c26677-797d-481c-abaf-8d3fafa315b0"

  def devise_mail(record, action, opts = {}, &block)
    initialize_from_record(record)
    Mail::Notify::Mailer.view_mail(STANDARD_EMAIL_TEMPLATE, headers_for(action, opts))
  end
end
