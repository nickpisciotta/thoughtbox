require 'rails_helper'

RSpec.describe "User can submit links" do
  scenario "with valid urls" do
    user = create_user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".link-form") do
      fill_in "link[title]", with: "First Link"
      fill_in "link[url]", with: "https://example.com"
      click_button("Save Link")
    end

    expect(current_path).to eq(links_path)

  end
end
