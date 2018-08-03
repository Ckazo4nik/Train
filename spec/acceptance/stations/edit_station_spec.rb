require 'rails_helper'

feature 'Edit station' do
  let!(:station) { create :station}
  scenario 'Admin can edit station' do
    visit stations_path
    click_on Station.last.name
    click_on 'Edit'
    fill_in 'Station name', with: 'Lviv'
    click_on 'Save'
    station = Station.last
    expect(page).to have_content 'successfully updated.'
    expect(station.name).to eq 'Lviv'
  end
  scenario 'Admin can edit station failed' do
    visit stations_path
    click_on Station.last.name
    click_on 'Edit'
    fill_in 'Station name', with: nil
    click_on 'Save'

    expect(page).to have_content 'Name can\'t be blank'
  end
end