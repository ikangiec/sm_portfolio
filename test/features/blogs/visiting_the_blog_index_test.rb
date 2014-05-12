require "test_helper"

feature "VisitingBlogIndex" do
  scenario "with existing posts, show list" do
    # Given existing posts
    visit root_path

    # When I visit /posts

    # Then the existing posts should be loaded
  end
end
