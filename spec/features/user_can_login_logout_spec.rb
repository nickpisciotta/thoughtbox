require 'rails_helper'

RSpec.feature "User login" do
  scenario "cannot login with invalid email and password" do
    visit root_path

    within('.navbar') do
      expect(page).to have_link("Log In")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Log Out")
    end

    click_on "Log In"

    expect(current_path).to eq(login_path)

    within('.login-form') do
      fill_in "session[email]", with: "test@email.com"
      fill_in "session[password]", with: "password"
      click_on "Log In"
    end

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Invalid Login")
  end

  scenario "can login with valid email and password" do
    visit root_path

    click_on "Sign Up"

    sign_up_user

    click_on "Log Out"

    expect(current_path).to eq(login_path)

    within(".login-form") do
      fill_in "session[email]", with: 'fake@email.com'
      fill_in "session[password]", with: 'password'
      click_on "Log In"
    end

    expect(current_path).to eq(links_path)
    expect(page).to have_link("Log Out")
  end
end
