require "rails_helper"

describe "sys_admin_tasks" do
  let(:email) { Faker::Internet.email }
  let(:run_destroy_user) do
    Rake::Task["sys_admin_tasks:destroy_user"].invoke(email)
  end

  before(:each) do
    Rails.application.load_tasks
  end

  after(:each) do
    Rake::Task["sys_admin_tasks:destroy_user"].reenable
  end

  describe "#destroy_user" do
    it "reduces user count" do
      FactoryBot.create(:user, email: email)

      expect { run_destroy_user }.to change { User.count }
        .from(User.count)
        .to(User.count - 1)
    end

    context "User not found" do
      it "raises error" do
        expect { run_destroy_user }.to raise_error(StandardError)
      end
    end
  end
end
