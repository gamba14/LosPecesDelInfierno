require "rails_helper"

RSpec.feature "Los administradores pueden crear nuevos usuarios" do 
	let(:admin) {FactoryGirl.create(:user, :admin)}

	before do
		login_as(admin)
		visit "/"
		click_link "Admin"
		click_link "Users"
		click_link "New User"
	end

	scenario "con atributos validos" do

		fill_in "Email", with: "example@ticketee.com"
		fill_in "Password", with: "password"
		click_button "Create User"
		expect(page) .to have_content "User has been created."
	end

	scenario "que seran usuarios administradores" do

		fill_in "Email", with: "admin1@ticketee.com"
		fill_in "Password", with: "password"
		check "Is an admin?"
		click_button "Create User"
		expect(page) .to have_content "User has been created."
		expect(page) .to have_content "admin1@ticketee.com (Admin)"
	end
end
