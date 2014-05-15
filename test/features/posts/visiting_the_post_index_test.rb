require "test_helper"

feature "As the visitor, I want to see the site owner's blog posts" do
  scenario "with existing posts, show list" do
    # Given existing posts
    Post.create(title: "Learn Feng Shui", body: "Means striving for excellence.")

    # When I visit /posts
    visit posts_path

    # Then the existing posts should be loaded
    page.text.must_include "Learn Feng Shui"
  end
end
