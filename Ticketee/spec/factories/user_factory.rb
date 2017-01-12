FactoryGirl.define do 
	factory :user do
		sequence(:email) { |n| "ejemplo#{n}@ejemplo.com" }
		password "password"
	end
end
