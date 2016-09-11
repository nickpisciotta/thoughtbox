require 'rails_helper'

RSpec.feature "User can login" do
  scenario "with valid email and password" do
    visit root_path

    within('.navbar') do
      expect(page).to have_link("Login")
      expect(page).to have_link("Sign Up")
      expect(page).to_not have_link("Logout")
    end

    click_on "Login"

    expect(current_path).to eq(login_path)
  end
end
