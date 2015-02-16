FactoryGirl.define do 

factory :user do

		#association(:profile)

    sequence(:email) { |i| "user#{ i }@you.ua" }
    sequence(:first_name) { |i| "first_name_#{ i }" }

    sequence(:last_name) { |i| "last_name_#{ i }" }

    password   "password"
    password_confirmation   "password"
    secret   "secret"

    position {position_user}

end


	
end

	def position_user
	 	if User.maximum(:position)
	      User.maximum(:position)+1
	    else
	      1
	    end
	end