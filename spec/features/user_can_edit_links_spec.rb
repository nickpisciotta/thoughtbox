require 'rails_helper'

RSpec.feature "User can edit links", js: true do
  scenario "Change title and url" do
    visit new_user_path

    within(".user_form") do
      fill_in "user[email]", with: "example@email.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button("Sign Up")
    end

    expect(current_path).to eq('/links')

    within(".link-form") do
      fill_in "link[title]", with: "Valid Link"
      fill_in "link[url]", with: "https://website.com"
      click_button("Save Link")
    end

    within(".links-list") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("https://website.com")
      expect(page).to have_button("Edit")

      click_button("Edit")
    end

    expect(page).to have_current_path('/links/1/edit')

    within(".edit_link_form") do
      fill_in :link_title, with: "Updated"
      fill_in :link_url, with: "https://newwebsite.com"

      click_button("Update Link")
    end

    expect(page).to have_current_path('/links')

    within(".links-list") do
      expect(page).to_not have_text("Valid Link")
      expect(page).to have_text("Updated")
      expect(page).to have_text("https://newwebsite.com")

      expect(page).to have_button("Edit")
    end
  end
end
