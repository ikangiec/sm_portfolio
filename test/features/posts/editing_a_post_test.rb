require "test_helper"

feature "editing a post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    sign_in
    visit post_path(posts(:fs))

    # When I click edit and submit changed data
    click_on "Edit"
    fill_in "Body", with: "Becoming a Feng Shui Master"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include posts(:fs).title
    page.text.must_include "Becoming a Feng Shui Master"
  end
end
