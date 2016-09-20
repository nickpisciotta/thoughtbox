require 'rails_helper'

RSpec.describe "Unregistered site access" do
  scenario "cannot access edit page" do
    link = create_link

    visit edit_link_path(link)

    expect(current_path).to eq(login_path)
  end
end
