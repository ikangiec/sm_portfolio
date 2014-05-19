require "test_helper"

feature "deleting a post" do
  scenario "post is deleted with a click" do
    # Given an existing post
    sign_in(:editor)
    visit posts_path

    # When the delete link is clicked
    # page.find("tbody tr:last").click_on "Destroy"
    page.find("div:last div:last").click_on "Destroy"

    # Then the post is deleted
    page.wont_have_content "Sherman"
  end
end
