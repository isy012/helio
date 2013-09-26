require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Home'" do
      visit '/landing_pages/home.html'
      expect(page).to have_content('home')
    end
  end

  describe "FAQ page" do

    it "should have the content 'FAQ'" do
      visit '/landing_pages/faq.html'
      expect(page).to have_content('faq')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
  
end
