require "test_helper"

feature "creating a post" do
  scenario "submit form data to create a new blog post" do
    # Given an authorized user complets a new post format
    # sign_in
    visit new_post_path

    fill_in "Title", with: posts(:fs).title
    fill_in "Body", with: posts(:fs).body

    # When I submit the form
    click_on "Create Post"

    # Then a new post should be created and displayed
    page.text.must_include posts(:fs).title
    page.text.must_include posts(:fs).body
    # page.has_css? "#author"
    # page.text.must_include users(:sherman).email
  end
end
