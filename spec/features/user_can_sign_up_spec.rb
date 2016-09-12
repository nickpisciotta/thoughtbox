require 'rails_helper'

RSpec.feature "User can sign up" do
  scenario "with valid email and password" do
    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    within(".user_form") do
      fill_in "user[email]", with: "test@email.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_on "Sign Up"
    end

    expect(current_path).to eq(links_path)

    within(".navbar") do
      expect(page).to_not have_link("Log In")
      expect(page).to_not have_link("Sign Up")
      expect(page).to have_link("Logout")
    end
  end
end
