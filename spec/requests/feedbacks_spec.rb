require 'rails_helper' 
# spec/requests/feedbacks_spec.rb

describe "Feedbacks" do 
	describe "Manage Feedback Listing" do 
		it "Adds a new Feedback and displays the results" do 
			visit feedbacks_url 
			expect{ 
				click_link 'New Feedback' 
				fill_in 'feedback_text', with: "Final Job" 
				click_button "Create Feedback" 
			}.to change(Feedback,:count).by(1) 
			page.should have_content "Feedback was successfully created."
				within 'h1' do 
				page.should have_content "Final Job" 
				end 
			end 

		it "Updates an existing Feedback and displays the results" do
			end 

		it "Deletes a feedback" do 
			feedback = create(:feedback, text: "Final Job")
			visit feedbacks_path 
				expect{ 
					within "#Feedback_#{feedback.id}" do 
					click_link 'Destroy' 
				end 
				alert = page.driver.browser.switch_to.alert
				alert.accept
		}.to change(Feedback,:count).by(-1) 
		page.should have_content "Listing feedbacks" 	
		page.should_not have_content "Final Job" 
	end
     end 
end
