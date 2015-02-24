require 'rails_helper'

# RSpec.configure do |config|
#   config.include FactoryGirl::Syntax::Methods
# end

RSpec.describe User, :type => :model do
	let!(:user) {create(:user)}

	it 'method secret_word = true' do
		user1=user
  	user1.secret_word?(user1.secret).should==true
	end

	it 'user authenticate = true' do
		user1=user
		User.authenticate(user1.email, user1.password).should==user1
	end

end
