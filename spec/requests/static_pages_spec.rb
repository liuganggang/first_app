require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {'Ruby on Rails Tutorial Sample App'}

  describe "home page" do
    it "should have content 'my app'" do
      visit '/static_pages/home'
      expect(page).to have_content('my app')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "help page" do
    it "should have content 'need help'" do
      visit '/static_pages/help'
      expect(page).to have_content('need help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should visit About_page and have content 'about us'" do
      visit '/static_pages/about'
      expect(page).to have_content('about us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About Us")
    end
  end

  describe 'Contact page' do
    it "should visit contact_page and have_content 'Contact Us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact Us')
    end

    it "should have title Contact" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | Contact")
    end
  end

end
