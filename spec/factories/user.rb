FactoryGirl.define do 

factory :user do

		#association(:profile)

    sequence(:email) { |i| "user#{ i }@you.ua" }
    sequence(:first_name) { |i| "first_name_#{ i }" }

    sequence(:last_name) { |i| "last_name_#{ i }" }

    password   "password"
    secret   "secret"

end

 

	
end