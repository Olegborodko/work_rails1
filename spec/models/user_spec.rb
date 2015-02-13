require 'rails_helper'

# RSpec.configure do |config|
#   config.include FactoryGirl::Syntax::Methods
# end

RSpec.describe User, :type => :model do
	it 'mazafaka' do
  	user1=create(:user)
  	user1.password.should =='password'
	end

end


# describe User do 
# 	it "should do something" do
# 		(1+1).should == 2
# 	end
	
# end
