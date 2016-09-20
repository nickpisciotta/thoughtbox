require "rails_helper"

RSpec.describe "Links scoped to a user", js: true do
  scenario "user cannot see other user links" do
    visit root_path

    click_on "Sign Up"

    sign_up_user

    within(".link-form") do
      fill_in "link[title]", with: "First Link"
      fill_in "link[url]", with: "https://example.com"
      click_button("Save Link")
    end

    within(".links-list") do
      expect(page).to have_content("First Link")
    end

    click_on "Log Out"

    visit root_path

    click_on "Sign Up"

    sign_up_second_user

    expect(page).to_not have_content("First Link")
  end   
end
