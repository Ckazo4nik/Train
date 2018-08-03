require 'rails_helper'

feature 'Create train' do
  scenario 'successfully create' do
    visit new_train_path
    fill_in 'First station name', with: 'Lviv'
    fill_in 'Last station name', with: 'Harkiv'
    click_on 'Save'

    expect(page).to have_content 'successfully updated.'
  end
end