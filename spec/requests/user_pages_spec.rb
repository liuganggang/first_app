require 'spec_helper'

describe "UserPages" do
  subject { page }

  describe "have a sign_up_page" do
    before { visit sign_up_path }
    it { should have_content('sign up') }
    it { should have_title(full_title('Sign_up')) }
  end
end
