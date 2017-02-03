require "ralis_helper"

RSpec.feature "Los administradores pueden modificar usuarios" do 

	let(:admin_user){FactoryGirl.create(:user, :admin)}
	let(:user) {FactoryGirl.create(:user)}

	before do
		login_as(admin_user)
		visit admin_user_path(user)
		click_link "Edit User"
	end

	scenario "Con atributos validos" do
		fill_in "Email", with: "nuevo@ejemplo.com"
		click_button "Update User"

		expect(page) .to have_content "User has been updated."
		expect(page) .to have_content "nuevo@ejemplo.com"
		expect(page) .to_not have_content user.email 
	end

	scneario "y convierten en administradores" do
		check "Is an admin?"
		click_button "Update User"

		expect(page) .to have_content "User has been updated."
		expect(page) .to have_content "#{user.email}(Admin)"
			
		end
end