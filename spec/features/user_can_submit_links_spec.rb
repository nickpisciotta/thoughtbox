require 'rails_helper'

RSpec.describe "User can submit links" do
  scenario "with valid urls" do
    user = create_user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit links_path

    within(".link_form") do

    end

    
  end
end
