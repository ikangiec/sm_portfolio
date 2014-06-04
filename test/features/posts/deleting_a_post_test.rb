require "test_helper"

feature "deleting a post" do
  scenario "post is deleted with a click" do
    # Given I am signed in as an editor
    sign_in(:editor)

    # And an existing post (from fixtures)
    visit posts_path

    # When the delete link is clicked
    # page.find("tbody tr:last").click_on "Destroy"
    post_title = page.find("div:first h3:first").text
    # page.find("div:last div:last").click_on "Destroy"
    # page.find(:xpath, '//link[contains(text(), "Destroy")]')[2].click
    page.find('div', text: post_title).click_on "Destroy"

    # Then the post is deleted
    # page.wont_have_content "Sherman"
    page.wont_have_content post_title
  end
end
