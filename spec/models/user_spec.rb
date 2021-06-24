require "rails_helper"

RSpec.describe User, type: :model do
  specify { expect(create(:user)).to be_valid }

  context "validation" do
    specify { expect { create(:editor, email: "") }.to raise_error(ActiveRecord::RecordInvalid) }
    specify { expect { create(:editor, email: "@") }.to raise_error(ActiveRecord::RecordInvalid) }
    specify { expect { create(:editor, email: "1@2") }.to raise_error(ActiveRecord::RecordInvalid) }
    specify { expect { create(:editor, email: "!£$%") }.to raise_error(ActiveRecord::RecordInvalid) }
  end
end
