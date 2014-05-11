require "test_helper"

feature "CanAccessHome" do
  scenario "homepage has content" do
    visit root_path
    page.must_have_content "Sherman"
    assert page.has_content?("Home#index")
    # page.wont_have_content "Goobye All!"
  end
end
