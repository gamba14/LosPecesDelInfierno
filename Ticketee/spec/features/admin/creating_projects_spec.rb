require "rails_helper"
RSpec.feature "Los usuarios pueden crear nuevos proyectos" do 
	before do
		login_as(FactoryGirl.create(:user, :admin))
	end
	scenario "con informacion valida" do
		visit "/"

		click_link "New Project"

		fill_in("Name", with: "Sublime Text 3", match: :first)
		fill_in("Description", with: "un editor de texto para todos", match: :first)
		click_button "Create Project"

		expect(page) .to have_content ("Project has been created")

		project = Project.find_by(name: "Sublime Text 3")
		expect(page.current_url) .to eq project_url(project)

		title = "Sublime Text 3 - Projects - Ticketee"
		expect(page) .to have_title title


	end	
	scenario "pero la informacion no es valida" do
		visit "/"

		click_link "New Project"

		click_button "Create Project"

		expect(page) .to have_content "Project has not been created."
		expect(page) .to have_content "can't be blank"
	end
end