require 'rails_helper'

RSpec.feature 'User can sort links by status', js: true do
  scenario "by clicking the 'Show Read' button" do
    visit new_user_path

    within('.user_form') do
      fill_in 'user[email]', with: 'example@email.com'
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'
      click_button('Sign Up')
    end

    within('.link-form') do
      fill_in 'link[title]', with: '1 Link'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.link-form') do
      fill_in 'link[title]', with: '2 Link'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.link-form') do
      fill_in 'link[title]', with: '3 Link'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.links-list') do
      expect(page).to have_text('1 Link')
      expect(page).to have_text('2 Link')
      expect(page).to have_text('3 Link')
    end

    within('.links-list') do
      first('.link').click_button('Mark as Read')
    end

    within('.filters') do
      click_button('Show Read')
    end

    within('.links-list') do
      expect(page).to have_text('3 Link')
      expect(page).to_not have_text('2 Link')
      expect(page).to_not have_text('1 Link')
    end

    within('.filters') do
      click_button('Show All')
    end

    within('.links-list') do
      expect(page).to have_text('1 Link')
      expect(page).to have_text('2 Link')
      expect(page).to have_text('3 Link')
    end
  end
end
