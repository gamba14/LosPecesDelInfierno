require "rails_helper"

RSpec.feature "los usuarios pueden iniciar sesion" do 
	let!(:user) { FactoryGirl.create(:user) }

	scenario "con credenciales validas" do

		visit "/"

		click_link "Sign in"

		fill_in "Email", with: user.email
		fill_in "Password", with: user.password

		click_button "Log in"

		expect(page) .to have_content "Signed in successfully."
		expect(page) .to have_content "Signed in as #{user.email}"

	end
end
