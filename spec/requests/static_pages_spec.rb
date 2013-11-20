require 'spec_helper'

describe "StaticPages" do
  subject { page }

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe "home page" do
    before { visit home_path }

    it { should have_content('my app') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end

  describe "help page" do
    before { visit help_path }

    it { should have_content('need help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('about us') }
    it { should have_title(full_title('About Us')) }
  end

  describe 'Contact page' do
    before { visit contact_path }

    it { should have_content('Contact Us') }
    it { should have_title(full_title('Contact')) }
  end

end
