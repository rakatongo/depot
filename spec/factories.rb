FactoryGirl.define do 
	factory :product do
		title "Example Product"
		description  Faker::Lorem.sentence
		image_url "ejemplo.jpg"
		price 33.43
	end
end