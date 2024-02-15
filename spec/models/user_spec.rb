require "rails_helper"

RSpec.describe User, type: :model do
  specify { expect(create(:user)).to be_valid }

  context "validation" do
    specify { expect { create(:editor, email: "") }.to raise_error(ActiveRecord::RecordInvalid) }
    specify { expect { create(:editor, email: "@") }.to raise_error(ActiveRecord::RecordInvalid) }
    specify { expect { create(:editor, email: "1@2") }.to raise_error(ActiveRecord::RecordInvalid) }
    specify { expect { create(:editor, email: "!£$%") }.to raise_error(ActiveRecord::RecordInvalid) }
  end

  describe "#reset_password" do
    let!(:user) { create :user }
    let(:password) { "FooBar123!!" }

    it "changes the password" do
      expect { user.reset_password(password, password) }.to(change { user.reload.encrypted_password })
    end

    it "raises an error if password blank" do
      user.reset_password("", password)
      expect(user.errors[:password]).to be_present
    end
  end

  # rubocop:disable Rails/SaveBang - specs need to use .update to check error behaviour
  describe "#ensure_at_least_one_user_has_admin_role" do
    let!(:user) { create :admin }

    it "prevents last admin being removed" do
      pending 'fails on github, passess locally, skipping as user admin is going away'

      expect(User.admin.count).to eq(1)
      user.update(role: :editor)
      expect(user.errors[:role]).to be_present
      expect(user.reload.role).to eq("admin")
    end

    it "allows a admin to be removed if second present" do
      _second_admin = create :admin
      user.update(role: :editor)
      expect(user.errors[:role]).not_to be_present
      expect(user.reload.role).to eq("editor")
    end
  end
  # rubocop:enable Rails/SaveBang
end
