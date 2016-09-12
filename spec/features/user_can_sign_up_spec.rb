require 'rails_helper'

RSpec.feature "User can sign up" do
  scenario "with valid email and password" do
    visit root_path


    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)
  end
end
