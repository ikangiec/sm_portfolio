require "test_helper"

feature "As the site visitor, I want to see a owner's portfolio item" do
  scenario "viewing one project" do
    # Given an existing project (loaded from fixtures)
    # When I visit /projects/:id
    visit project_path(projects(:freelance))
    # Then I should see the details of the project
    page.text.must_include "Floor Plan"
    page.text.must_include "Kitchen, Dining"
  end
end
