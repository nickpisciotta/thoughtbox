require 'rails_helper'

RSpec.describe "User submit invalid links", js: true do
  scenario "invalid links raise error" do
    visit root_path

    click_on "Sign Up"

    sign_up_user

    within(".link-form") do
      fill_in "link[title]", with: "Invalid Link"
      fill_in "link[url]", with: "notvalidlink"
      click_button("Save Link")
    end

    expect(page).to have_content ("invalid URL")
    expect(page).to_not have_content("notvalidlink")
  end
end
