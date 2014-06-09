require "test_helper"

feature "As a visitor, I want to send a message to the web developer so that I can tell him/her about the awesome project I want help with" do

  scenario "send a message on contact page" do
    # When I visit contact page
    visit new_contact_path

    # I can fill out a contact form
    fill_in 'Your name', with: "somme visitor"
    fill_in 'Your email', with: "somevisitor@example.com"
    fill_in 'Your phone number', with: "123-456-7890"
    fill_in 'Your message', with: "i love your website!"
    click_on "Send Message"

    # And I should see message sent
    page.must_have_content "Thank you"
  end

  #TODO:
  scenario "send an invalid message" do
    skip("will come back later for more edge cases")
  end
end
