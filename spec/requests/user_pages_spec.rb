require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "have a sign_up_page" do
    before { visit sign_up_path }

    it { should have_selector('h1', text: 'sign up') }
    it { should have_title(full_title('Sign_up')) }
  end

  describe "sugn_up." do
    let(:submit) { "Create my account" }

    before { visit sign_up_path }
    describe "with invalid information" do
      it "should not create a user." do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Emall",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end
      it "should create new user by fill_in." do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(emall: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end

  describe "show page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_selector('h3',text: user.emall) }
  end
end
