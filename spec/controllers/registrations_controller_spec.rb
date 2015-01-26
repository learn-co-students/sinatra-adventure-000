require 'spec_helper'

describe 'RegistrationsController' do
	describe "registrations page: GET /register" do
		before do
			get '/register'
		end

		it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "has a form with a name field and an email field" do
    	expect(last_response.body).to include('<form')
    	expect(last_response.body).to include('<input name="name">')
    	expect(last_response.body).to include('<input name="email">')
    end

    it "has a form that will redirect to the hello page" do
    	visit '/register'
    	fill_in('name', :with => 'Amanda')
    	fill_in('email', :with => 'chang@flatironschool.com')
    	click_button('submit')
    	expect(page).to have_content('Almost there, hero!')
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