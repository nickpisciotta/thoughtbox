require 'rails_helper'

RSpec.feature "User can filter links by search", js: true do
  scenario "by adding keys to the search field " do
    visit new_user_path

    sign_up_user

    within('.link-form') do
      fill_in 'link[title]', with: 'first'
      fill_in 'link[url]', with: 'https://different-website.com'
      click_button('Save Link')
    end

    within('.link-form') do
      fill_in 'link[title]', with: 'fist'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.link-form') do
      fill_in 'link[title]', with: 'second'
      fill_in 'link[url]', with: 'https://website.com'
      click_button('Save Link')
    end

    within('.links-list') do
      expect(page).to have_text('first')
      expect(page).to have_text('fist')
      expect(page).to have_text('second')
    end

    fill_in :search, with: 'f'

    within('.links-list') do
      expect(page).to have_text('first')
      expect(page).to have_text('fist')
      expect(page).to_not have_text('second')
    end

    fill_in :search, with: 'fir'

    within('.links-list') do
      expect(page).to have_text('first')
      expect(page).to_not have_text('fist')
      expect(page).to_not have_text('second')
    end

  end
end
