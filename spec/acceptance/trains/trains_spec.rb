require 'rails_helper'

feature 'Create train' do
  scenario 'successfully create' do
    visit new_train_path
    click_on 'create train'
    fill_in 'First station name', with: 'Orest'
    fill_in 'Last station name', with: 'Orest'
    click_on 'Save'

    expect(page).to have_content 'successfully updated.'
  end
  scenario 'failed create' do
    visit new_train_path
    click_on 'create train'
    fill_in 'First station name', with: 'Orest'
    fill_in 'Last station name', with: 'Orest'
    click_on 'Save'

    expect(page).to have_content 'Station can\'t be blank'
  end
end