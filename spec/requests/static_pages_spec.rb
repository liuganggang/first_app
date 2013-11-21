require 'spec_helper'

describe "StaticPages" do
  subject { page }

  it "should have clicklink in layout" do
    visit home_path
    click_link 'About'
    expect(page).to have_title('About Us')
    click_link 'Help'
    expect(page).to have_title('Help')
  end

  shared_examples_for "all static pages" do
    it { should have_content(content) }
    it { should have_title(full_title(page_title)) }
  end

  describe "home page" do
    before { visit home_path }
    let(:content) { 'my app' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }

  end

  describe "help page" do
    before { visit help_path }
    let(:content) { 'need help' }
    let(:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let(:content) { 'about us' }
    let(:page_title) { 'About Us' }

    it_should_behave_like "all static pages"
  end

  describe 'Contact page' do
    before { visit contact_path }
    let(:content) { 'Contact Us' }
    let(:page_title) { 'Contact' }

    it_should_behave_like "all static pages"
  end

end
