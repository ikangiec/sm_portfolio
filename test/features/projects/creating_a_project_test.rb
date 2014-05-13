require "test_helper"

feature "As the site owner, I want to add a project item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Title", with: "Sherman's Caligraphy"
    fill_in "Description", with: "Oracle script, Bronze script, Large seal script, Small seal script, Clerical script, Cursive script, Semi-cursive script, Regular script."
    click_on "Create Project"
    page.text.must_include "Project has been created"
    page.text.must_include "Caligraphy"
    page.text.must_include "script"
  end

  scenario "new project has invalid data" do
    # Given invalid project data is entered in a form
    visit new_project_path
    fill_in "Title", with: "Q"

    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"

    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Title is too short"
    page.text.must_include "Description can't be blank"
  end
end
