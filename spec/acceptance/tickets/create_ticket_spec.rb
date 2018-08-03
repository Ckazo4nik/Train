require 'rails_helper'

feature 'Create ticket' do
  let!(:train) { create :train}
  scenario 'successfully create' do
    visit root_path
    click_on Train.last.name
    click_on 'ticket'
    click_on 'Ok'

    expect(page).to have_content 'successfully created.'
  end
end