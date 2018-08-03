require 'rails_helper'

feature 'Login user' do
  scenario 'successfully login' do
    visit root_path
    click_on 'sign_up'
    fill_in 'User name', with: 'Orest'
    click_on 'Login'

    expect(current_path).to eq(user_path(User.last))
  end
  scenario 'failed login' do
    visit root_path
    click_on 'sign_up'
    fill_in 'User name', with: nil
    click_on 'Login'

    expect(page).to have_content 'Name can\'t be blank'
  end
end