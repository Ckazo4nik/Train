require 'rails_helper'

feature 'Login user' do
  scenario 'successfully login' do
    visit root_path
    click_on 'Login'
    fill_in 'Name', with: 'Orest'
    click_on 'Login'

    expect(page).to redirect_to users_path
  end
  scenario 'failed login' do
    visit root_path
    click_on 'Login'
    fill_in 'Name', with: nil
    click_on 'Login'

    expect(page).to have_content 'Name can\'t be blank'
  end
end