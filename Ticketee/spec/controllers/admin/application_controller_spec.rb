require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do

  let(:user) {FactoryGirl.create(:user)}

  before do 
  	allow(controller) .to receive(:authenticate_user!)
  	allow(controller) .to receive(:current_user) .and_return(user)
  end

  context "usuarios no administrativos" do
  	it "no estan autorizados a acceder a la accion index" do

  	get :index

  	expect(response) .to redirect_to "/"
  	expect(flash[:alert]) .to eq "You must be an admin to do that."

  	end
	end

end
