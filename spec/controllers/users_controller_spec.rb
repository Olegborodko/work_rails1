require 'rails_helper'

describe Public::UsersController do 
	 let(:user) { create(:user) }
	 let(:user_attributes) { attributes_for(:user) }


	describe "index action" do
		it 'not current_user' do
			get :index, {}
			assigns(:user).should be_nil
		end

		it 'if current_user' do
			get :index, {}, user_id: user.id
			assigns(:user).should == User.find(user.id) #assigns
		end
	end

	describe "create action" do
		it 'user was created' do
			post :create, {user: user_attributes}
			response.should redirect_to(root_url)
		end 

		 it 'user was not created' do
			post :create, user: { name: nil }
			response.should render_template('new')
		 end 
	end

	#------------------

	describe "validation_ajax email action" do
		it 'email is not valid' do
			post :validation_ajax, {}
			assigns(:data).errors[:email].first.should_not be_nil
		end

		it 'email is valid' do
			post :validation_ajax, {email_form: "2@2.ua"} 

			response.body.should include("response_='V'") #
			assigns(:data).errors[:email].first.should be_nil
		end
	end

	describe "update action" do

		it 'user was updated' do

			  patch :update, { id: user.id, user: { first_name: "new_name" }, format: :js }, { user_id: user.id }

			 assigns(:user).first_name.should=="new_name"
			 assigns(:rezult).should==true
		end

		 it 'user was not updated' do
		 		patch :update, { id: user.id, user: { email: "" }, format: :js }, { user_id: user.id }
		 		assigns(:rezult).should==false
		 end

		 it 'user not current' do
		 		patch :update, { id: user.id, user: { first_name: "new_name" }, format: :js }
		 		response.should redirect_to(root_url)
		 end
	end

end