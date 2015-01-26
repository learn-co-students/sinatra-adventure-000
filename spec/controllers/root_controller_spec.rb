require 'spec_helper'

describe 'RootController' do
	describe "index page: GET /" do
		before do
			get '/'
		end

		it "responds with a 200 status code" do
      expect(last_response).to be_ok
    end

    it "renders a valid link to register" do
    	visit '/'
    	click_link('Register')
    	expect(page).to have_content('name')
    end
	end
end