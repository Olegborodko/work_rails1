require 'rails_helper'

describe Admin do 

	let(:admin) {
		create(:admin)
	}


	# it 'role = admin' do

	# 	role_1=create(:role, {name: "admin"})
	# 	role_2=create(:role, {name: "super_admin"})

	# 	admin1=admin  #create admin
		
	# 	admin1.role.should==role_1

  	
	# end

	it 'admin authenticate = true' do
		admin1=admin
		Admin.authenticate(admin1.email, admin1.password).should==admin1
	end
	
 end