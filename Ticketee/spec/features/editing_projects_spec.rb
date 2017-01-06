require "rails_helper"

RSpec.feature "Los usuarios pueden editar proyectos existentes" do
	before do
		FactoryGirl.create(:project, name: "Sublime Text 3")

		visit "/"
		click_link "Sublime Text 3"
		click_link "Edit Project"
	end

	scenario "con atributos validos" do 
		
		fill_in "Name", with: "Sublime Text 4 beta"
		click_button "Update Project"
		

		expect(page) .to have_content "Project has been updated."
		expect(page) .to have_content "Sublime Text 4 beta"
	end

	scenario "cuando el usuario manda fruta II" do
		fill_in "Name", with: " "
		click_button "Update Project"

		expect(page) .to have_content "Project hasn't been updated."
	end
end
