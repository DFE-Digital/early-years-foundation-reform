require "rails_helper"

RSpec.describe EarlyYearsMailer, type: :mailer do
  describe "send email" do 
    it "sends the correct email addresses" do
      mail = EarlyYearsMailer.send_early_years_email("to@example.org")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["mail@example.org"])
    end
  end
end
