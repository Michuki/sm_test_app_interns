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
			within 'body' do 
			page.should have_content "Final Job" 
		     	end 
		end 

		it "Updates an existing Feedback and displays the results" do
			DatabaseCleaner.clean
			feedback = create(:feedback, text: "New Job")
			visit feedbacks_path
			expect{
				click_link 'Edit'
				fill_in 'feedback_text', with: "Edit Job"
				click_button "Update Feedback"  
			}.to change(Feedback,:count).by(0) 
			page.should have_content "Feedback was successfully updated."
			within 'body' do 
			page.should have_content "Edit Job" 			
			end
 		end

		it "Deletes a feedback" , js: true do
 			DatabaseCleaner.clean
			feedback = create(:feedback, text: "Final Job")
			visit feedbacks_path 
			expect{ 
				#within "#feedbacks#{feedback.id}" do 
				#page.all(:xpath, '//a[@id="#feedbacks/#{feedback.id}"]') do
				click_link 'Destroy' 
			  	#end
			      alert = page.driver.browser.switch_to.alert
			      alert.accept
			}.to change(Feedback,:count).by(0) 
		page.should have_content "Listing feedbacks" 	
		page.should_not have_content "Final Job" 
	end
     end 
end
