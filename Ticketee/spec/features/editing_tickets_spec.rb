require "rails_helper"

RSpec.feature "Los usuarios pueden crear nuevos proyectos" do 
	before do
		sublime = FactoryGirl.create(:project, name: "Sublime Text 3")
		FactoryGirl.create(:ticket, project: sublime, name: "Make it shiny!",
		description: "Gradients! Starbursts! Oh My!")

		ie = FactoryGirl.create(:project, name: "Internet Explorer")
		FactoryGirl.create(:ticket, project: ie,
		name: "Standards compliance", description: "Isn't a joke.")
		
		visit "/"

		click_link "Sublime Text 3"

		click_link "Make it shiny!"

		click_link "Edit Ticket"

		let(:author) {FactoryGirl.create(:user)}
		let(:project) {FactoryGirl.create(:project)}
		let(:ticket) do
			FactoryGirl.create(:ticket, project: project, author: author)
		end
	end

	scenario "para un proyecto dado" do

		
		fill_in "Name", with: "Make it really shiny!"

		click_button "Update Ticket"

		expect(page) .to have_content "Ticket has been updated."

		within("#ticket h2") do

			expect(page) .to have_content "Make it really shiny!"
			
		end
	end

	scenario "para un proyecto dado no validar" do

		fill_in "Name", with: " "

		click_button "Update Ticket"

		expect(page) .to have_content "Ticket has not been updated."
	end
end

