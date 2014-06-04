require "test_helper"

feature "editing a post" do
  scenario "submit updates to an existing post" do
    # Given an existing post
    sign_in
    visit posts_path(posts(:fs))

    # When I click edit and submit changed data
    # page.find("div:last div:last").click_on "Edit"
    page.find('div', text: posts(:fs).title).click_on "Edit"
    # find("a", :text => "Edit", match: :first).click
    # page.find("tbody tr:last").click_on "Edit"
    fill_in "Body", with: "Becoming a Feng Shui Master"
    click_on "Update Post"

    # Then the post is updated
    page.text.must_include posts(:fs).title
    page.text.must_include "Becoming a Feng Shui Master"
  end
end
