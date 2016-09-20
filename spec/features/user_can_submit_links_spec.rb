require 'rails_helper'

RSpec.describe "User submit links", js: true do
  scenario "with valid urls" do
    visit root_path

    click_on "Sign Up"

    sign_up_user

    within(".link-form") do
      fill_in "link[title]", with: "First Link"
      fill_in "link[url]", with: "https://example.com"
      click_button("Save Link")
    end

    expect(current_path).to eq(links_path)

    within(".links-list") do
      expect(page).to have_content("First Link")
    end

    click_on "Log Out"
  end

end
