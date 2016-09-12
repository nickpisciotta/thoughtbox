require 'rails_helper'

RSpec.feature "User cannot login" do
  scenario "with invalid email and password" do
    visit root_path

    within('.navbar') do
      expect(page).to have_link("Login")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Logout")
    end

    click_on "Login"

    expect(current_path).to eq(login_path)

    within('.login-form') do
      fill_in "session[email]", with: "test@email.com"
      fill_in "session[password]", with: "password"
      click_on "Log In"
    end
  end
end
