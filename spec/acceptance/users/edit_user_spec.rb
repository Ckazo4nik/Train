require 'rails_helper'

feature 'Edit user' do
  let!(:user) { create :user}
  before do
    sign_up(user)
  end
  scenario 'User can edit name' do
    visit users_path
    click_on User.last.name
    click_on 'Edit'
    fill_in 'User name', with: 'Ira'
    click_on 'Login'
    user = User.last
    expect(page).to have_content 'successfully updated.'
    expect(user.name).to eq 'Ira'
  end
  scenario 'User can\' edit name ' do
    visit users_path
    click_on User.last.name
    click_on 'Edit'
    fill_in 'User name', with: nil
    click_on 'Login'

    expect(page).to have_content 'Name can\'t be blank'
  end
end