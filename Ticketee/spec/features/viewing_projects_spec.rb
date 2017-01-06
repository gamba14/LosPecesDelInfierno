require "rails_helper"

RSpec.feature "Los usuarios pueden ver proyectos" do
	scenario "con los detalles del proyecto" do
		project = FactoryGirl.create(:project, name: "Sublime Text 3")

		visit "/"
		click_link "Sublime Text 3"
		expect(page.current_url) .to eq project_url(project)
	end
end

	
