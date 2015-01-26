require 'rails_helper' 

describe Feedback do 
   it "has a valid factory" do
	feedback = FactoryGirl.create(:feedback).should be_valid
   end
   it "is invalid without text" do
	build(:feedback, text: nil).should_not be_valid 
   end
   it "returns a full string of entered feedback" do
	create(:feedback, text: "Good Job").text.should == "Good Job"
   end
end
