require 'rails_helper'

feature 'deleted user' do
  let!(:user) { create :user}
  before do
    sign_up(user)
  end
  scenario 'User can deleted profile' do
    visit users_path
    click_on User.last.name
    click_on 'Delete'
    expect(page).to have_content 'User was successfully destroyed.'
  end
end