require "rails_helper"
RSpec.feature "Los usuarios pueden crear nuevos proyectos" do 
	scenario "with valid attributes" do
		visit "/"

		click_link "New Project"

		fill_in("Name", with: "Sublime Text 3", match: :first)
		fill_in("Description", with: "un editor de texto para todos", match: :first)
		click_button "Create Project"

		expect(page) .to have_content ("Project has been created")
	end	
end