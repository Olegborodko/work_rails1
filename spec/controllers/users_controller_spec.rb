require 'rails_helper'

describe Public::UsersController do 

	describe "index" do
		it 'not current_user' do
			get :index, {}
			response.should render_template('index')
		end

		it 'current_user' do
			get :edit1, {id: 0}  
			response.status.should == 404
		end
	end

end