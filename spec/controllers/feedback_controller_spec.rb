#spec/controllers/feedback_controller_spec.rb

require 'rails_helper'

describe FeedbacksController do
#GET 
describe "GET #index" do 
	it "gets the list of all feedbacks" do 
		feedback = create(:feedback) 
		get :index 
		assigns(:feedbacks).should eq([feedback]) 
	end
 
	it "shows the :index view" do 
		get :index 
		response.should render_template :index 
	    end 
	end

    describe "GET #show" do 
	it "assigns the fetched feedback to @feedback" do 
		feedback = create(:feedback) 
		get :show, 
		id: feedback 
		assigns(:feedback).should eq(feedback) 
	end
 
	it "renders the #show view" do 
		get :show, 
		id: create(:feedback) 
		response.should render_template :show 
	end
    end
#POST
describe "POST create" do 
	context "with valid text" do 
	     it "creates a new feedback" do
	 	expect{ 
			post :create, feedback: attributes_for(:feedback) 
		}.to change(Feedback,:count).by(1) 
	     end 

	     it "redirects to the new feedback" do 
		post :create, feedback: attributes_for(:feedback) 
		response.should redirect_to Feedback.last 
	     end 
	end
 
	context "with invalid text" do 
		it "does not save the new feedback" do 
		expect{ 
			post :create, 
			feedback: attributes_for(:invalid_feedback) 
		}.to_not change(Feedback,:count) 
	end 
	
	it "re-renders the new method" do 
		post :create, 
		feedback: attributes_for(:invalid_feedback) 
		response.should render_template :new 
		end 
	     end 
	end
#PUT
describe 'PUT update' do 
		before :each do 
			@feedback = create(:feedback, text: "Good Job") 
		end 

	context "valid text" do 
		it "locates the requested @feedback" do 
			put :update, 
                	id: @feedback, 
                	feedback: attributes_for(:feedback) 
			assigns(:feedback).should eq(@feedback) 
		end 
	
		it "changes the @feedback's text" do 
			put :update, id: @feedback, feedback: attributes_for(:feedback, text: "Update Job") 	
                	@feedback.reload 
			@feedback.text.should eq("Update Job") 
		end 

		it "redirects to the new feedback" do 
			put :update, 
			id: @feedback, 
			feedback: attributes_for(:feedback) 
			response.should redirect_to @feedback 
		end 
	    end 

	context "invalid text" do 
		it "locates the requested @feedback" do 
			put :update, id: @feedback, 
			feedback: attributes_for(:invalid_feedback) 
			assigns(:feedback).should eq(@feedback) 
	    	end 
	
		it "does not change @feedback's text" do 
			put :update, id: @feedback, feedback: attributes_for(:feedback, text: nil)
			@feedback.reload 
			@feedback.text.should_not eq("Good Job")
	    	end
		it "re-renders the edit method" do 
			put :update, 
			id: @feedback, 
			feedback: attributes_for(:invalid_feedback) 
			response.should render_template :edit 
		end 
	    end 
	end
#DELETE
	describe 'DELETE destroy' do 
		before :each do 
			@feedback = create(:feedback) 
	    end 
	
	it "deletes the feedback" do 
		expect{ 
			delete :destroy, 		
			id: @feedback 
		}.to change(Feedback,:count).by(-1) 
	    end 

	it "redirects to feedbacks#index" do 
		delete :destroy, 
		id: @feedback 
		response.should redirect_to feedbacks_url 
	    end 
	end
end
