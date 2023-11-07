require "rails_helper"

RSpec.describe Admin::UsersController, type: :request do
  let(:user) { create :user }

  describe "GET /admin/users" do
    context "as admin" do
      it "renders a successful response" do
        sign_in create(:admin)
        get admin_users_path
        expect(response).to be_successful
      end
    end

    context "as editor" do
      it "redirects to root" do
        sign_in create(:editor)
        get admin_users_path
        expect(response).to redirect_to(admin_content_pages_path)
      end
    end

    context "user not signed in" do
      it "redirects to user sign in" do
        get admin_users_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "GET /admin/users/new" do
    it "renders successfully" do
      sign_in create(:admin)
      get new_admin_user_path
      expect(response).to be_successful
    end
  end

  describe "POST /admin/users" do
    let(:user_attributes) { attributes_for :user }
    subject { post admin_users_path, params: { user: user_attributes } }

    context "as admin" do
      before { sign_in create(:admin) }

      it "creates a new user" do
        expect { subject }.to change(User, :count).by(1)
      end

      it "redirects to index" do
        subject
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "as admin with invalid entry" do
      let(:user_attributes) { attributes_for :user, email: "invalid" }
      before { sign_in create(:admin) }

      it "creates a new user" do
        expect { subject }.not_to change(User, :count)
      end

      it "renders form" do
        subject
        expect(response).to be_successful
      end
    end

    context "as editor" do
      before { sign_in create(:editor) }

      it "does not create a new user" do
        expect { subject }.not_to change(User, :count)
      end

      it "renders the form" do
        subject
        expect(response).to be_successful
      end

      it "displays a message" do
        subject
        expect(unescaped_response_body).to include("You don't have permission to create a user")
      end
    end
  end

  describe "GET /admin/users/:id/edit" do
    it "renders successfully" do
      sign_in create(:admin)
      get edit_admin_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "PUT /admin/users/:id" do
    let(:user_attributes) { attributes_for :user }
    let(:user) { create :user }

    subject { put admin_user_path(user), params: { user: user_attributes } }

    context "with admin and blank password" do
      let(:user_attributes) { attributes_for :user, password: "" }
      before { sign_in create(:admin) }

      it "modifies the user" do
        subject
        expect(user.reload.first_name).to eq(user_attributes[:first_name])
      end

      it "does not modify the password" do
        expect { subject }.not_to(change { user.reload.encrypted_password })
      end

      it "redirects to index" do
        subject
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "with admin, blank password, and invalid submission" do
      let(:user_attributes) { attributes_for :user, password: "", email: "invalid" }
      before { sign_in create(:admin) }

      it "modifies the user" do
        subject
        expect(user.reload.first_name).not_to eq(user_attributes[:first_name])
      end

      it "does not modify the password" do
        expect { subject }.not_to(change { user.reload.encrypted_password })
      end

      it "renders the form" do
        subject
        expect(response).to be_successful
      end
    end

    context "with admin and matching passwords" do
      let(:password) { "#{Faker::Lorem.word}!!12XX" }
      let(:user_attributes) { attributes_for :user, password: password, password_confirmation: password }
      before { sign_in create(:admin) }

      it "modifies the user" do
        subject
        expect(user.reload.first_name).to eq(user_attributes[:first_name])
      end

      it "modifies the password" do
        expect { subject }.to(change { user.reload.encrypted_password })
      end

      it "redirects to index" do
        subject
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "with admin and miss-matching passwords" do
      let(:user_attributes) { attributes_for :user, password_confirmation: Faker::Lorem.word }
      before { sign_in create(:admin) }

      it "does not modify the user" do
        subject
        expect(user.reload.first_name).not_to eq(user_attributes[:first_name])
      end

      it "does not modify the password" do
        expect { subject }.not_to(change { user.reload.encrypted_password })
      end

      it "renders the form" do
        subject
        expect(response).to be_successful
      end
    end

    context "as editor" do
      before { sign_in create(:editor) }

      it "does not modify user" do
        subject
        expect(user.reload.first_name).not_to eq(user_attributes[:first_name])
      end

      it "renders the form" do
        subject
        expect(response).to be_successful
      end

      it "displays a message" do
        subject
        expect(unescaped_response_body).to include("You don't have permission to update a user")
      end
    end
  end

  describe "DELETE /admin/users/:id" do
    let!(:user) { create :user }
    subject { delete admin_user_path(user) }

    context "as admin" do
      before { sign_in create(:admin) }

      it "deletes the user" do
        expect { subject }.to change(User, :count).by(-1)
      end

      it "redirects to index" do
        subject
        expect(response).to redirect_to(admin_users_path)
      end
    end

    context "as editor" do
      before { sign_in create(:editor) }

      it "does not create a new user" do
        expect { subject }.not_to change(User, :count)
      end

      it "renders the form" do
        subject
        expect(response).to be_successful
      end

      it "displays a message" do
        subject
        expect(unescaped_response_body).to include("You don't have permission to delete this user")
      end
    end
  end
end
