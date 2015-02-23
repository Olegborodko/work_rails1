FactoryGirl.define do 

factory :admin do

		#association(:profile)

    sequence(:email) { |i| "user#{ i }@you.ua" }
    sequence(:first_name) { |i| "first_name_#{ i }" }

    sequence(:last_name) { |i| "last_name_#{ i }" }

    password   "password"
    password_confirmation   "password"

    role_id "admin"


end
	
end

