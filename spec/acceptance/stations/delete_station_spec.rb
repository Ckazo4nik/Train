require 'rails_helper'

feature 'Edit station' do
  let!(:station) { create :station}
  scenario 'Admin can edit station' do
    visit stations_path
    click_on Station.last.name
    click_on 'Delete'
    expect(page).to have_content 'Station was successfully destroyed.'
  end
end