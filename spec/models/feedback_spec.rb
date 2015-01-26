require 'rails_helper' 

describe Feedback do 
   it "has a valid factory" do
	course = FactoryGirl.create(:feedback).should be_valid
   end
   it "is invalid without text" 
   it "returns a full string of entered feedback" 
end
