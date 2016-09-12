require 'rails_helper'

RSpec.feature "User can update links", js: true do
  scenario "as read" do
    visit new_user_path

    within(".user_form") do
      fill_in "user[email]", with: "fake@email.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button("Sign Up")
    end

    expect(current_path).to eq(links_path)

    within(".links-list") do
      expect(page).to_not have_text("Valid Link")
      expect(page).to_not have_text("http://google.com")
      expect(page).to_not have_button("Mark as Read")
    end

    within(".link-form") do
      fill_in "link[title]", with: "Valid Link"
      fill_in "link[url]", with: "http://google.com"
      click_button("Save Link")
    end

    expect(page).to have_current_path('/links')

    within(".links-list") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Read")

      click_button("Mark as Read")
    end

    within(".links-list") do
      expect(page).to have_text("Valid Link")
      expect(page).to have_text("http://google.com")
      expect(page).to have_button("Mark as Unread")

      click_button("Mark as Unread")
    end

    within('.links-list') do
      expect(page).to have_button("Mark as Read")
    end
  end
end
