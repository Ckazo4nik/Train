require 'rails_helper'

feature 'Create station' do
  scenario 'Admin create stations' do
    visit stations_path
    click_on 'Create station'
    fill_in 'Station name', with: 'Lviv'
    click_on 'Save'

    expect(page).to have_content 'successfully created.'
  end
  scenario 'Admin create stations' do
    visit stations_path
    click_on 'Create station'
    fill_in 'Station name', with: ''
    click_on 'Save'

    expect(page).to have_content 'Name can`t be blank'
  end
end