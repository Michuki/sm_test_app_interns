# spec/factories/feedback.rb
require 'faker'

FactoryGirl.define do
   factory :feedback do |f|
	f.text { Faker::Lorem.word }
    end

   factory :invalid_feedback, parent: :feedback do |f|
        f.text nil
    end
end

