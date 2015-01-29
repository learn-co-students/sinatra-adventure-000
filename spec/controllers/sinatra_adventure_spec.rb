require 'spec_helper'

describe 'Home Page' do
	before do
		visit '/'
	end

  it "contains a link to the registration page" do
  	expect(page).to have_css("a[href*='register']")
  end
end

describe 'Registration' do
  describe 'registration form' do
    before do
      visit '/register'
    end

    it "has a form with a name field and an email field" do
      expect(page).to have_css('form')
      expect(page).to have_field('name')
      expect(page).to have_field('email')
    end

    it "has a form that will redirect to the hello page" do
      fill_in('name', :with => 'Amanda')
      fill_in('email', :with => 'chang@flatironschool.com')
      click_button('submit')
      expect(current_path).to eq("/new")
    end
  end

  describe "new page: GET /new" do
    before do
      visit '/register'
      fill_in('name', :with => 'Amanda')
      fill_in('email', :with => 'chang@flatironschool.com')
      click_button('submit')
    end

    it "displays the email address used on registration" do
      expect(page).to have_content('chang@flatironschool.com')    
    end

    it "has a link that redirects to a grue" do
      click_link('xyzzy')
      expect(page).to have_content('You are likely to be eaten by a grue.')
    end
  end
end