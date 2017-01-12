require "rails_helper"
RSpec.feature "los usuarios pueden crear nuevos tickets" do
	
	let(:user) {FactoryGirl.create(:user)}

	before do
		login_as(user)
		project = FactoryGirl.create(:project, name: "Internet Explorer")
		visit project_path(project)
		click_link "New Ticket"
	end
	
	scenario "con atributos validos" do
		fill_in "Name", with: "Non-standards compliance"
		fill_in "Description", with: "My pages are ugly!"
		click_button "Create Ticket"

		expect(page).to have_content "Ticket has been created."
		within("#ticket") do
			expect(page) .to have_content "Author: #{user.email}"
		end		
	end

	scenario "y los atributos no son validos" do
		click_button "Create Ticket"
		expect(page).to have_content "Ticket has not been created."
		expect(page).to have_content "can't be blank"
		expect(page).to have_content "can't be blank"
	end

	scenario "y la descripcion es muy corta" do
		fill_in "Name", with: "Simple prueba"
		fill_in "Description", with: "menordiez"
		click_button "Create Ticket"
		expect(page) .to have_content "Ticket has not been created"
		expect(page) .to have_content "is too short (minimum is 10 characters)"
	end


end