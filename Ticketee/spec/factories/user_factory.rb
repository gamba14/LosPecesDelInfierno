FactoryGirl.define do 
	factory :user do
		sequence(:email) { |n| "ejemplo#{n}@ejemplo.com" }
		password "password"

		trait :admin do
			admin true
		end
	end
end
