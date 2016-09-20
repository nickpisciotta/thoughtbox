require 'rails_helper'

RSpec.feature "User can sort links alphabetically", js: true do
  scenario "by clicking Sort Alphabetically button" do
    visit new_user_path

    sign_up_user

    expect(page).to have_current_path('/links')

    within('.link-form') do
      fill_in 'link[title]', with: 'Z Link'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.link-form') do
      fill_in 'link[title]', with: 'A Link'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.link-form') do
      fill_in 'link[title]', with: 'B Link'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end
    
    within('.links-list') do
      expect(page).to have_selector('ul:first-child', text: 'Z Link')
      expect(page).to have_selector('ul:last-child', text: 'B Link')
    end

    within('.filters') do
      click_button('Sort Alphabetically')
    end

    within('.links-list') do
      expect(page).to have_selector('ul:first-child', text: 'A Link')
      expect(page).to have_selector('ul:last-child', text: 'Z Link')
    end

  end
end
