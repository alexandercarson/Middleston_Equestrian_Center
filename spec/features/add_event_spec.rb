require 'spec_helper'
require 'rails_helper'

feature 'admin can add a new event' do
  scenario 'admin can see link to owner info login' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'

    expect(page).to have_content('Add New Event')
  end

  scenario 'admin clicks on link Add New Note and is redirected to a form' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Event'

    expect(page).to have_content('Add New Event')
  end

  scenario 'admin can add a new event' do
    user = FactoryBot.create(:user)
    veterinarian = FactoryBot.create(:veterinarian)
    farrier = FactoryBot.create(:farrier)
    horse = FactoryBot.create(:horse, user: user, veterinarian: veterinarian, farrier: farrier)
    event = FactoryBot.create(:event, horse: horse, date: 20170901)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Event'
    select horse.barn_name, from: 'Horse'
    select '2017', from: 'event_date_1i'
    select 'September', from: 'event_date_2i'
    select '9', from: 'event_date_3i'
    fill_in 'Time', with: event.time
    fill_in 'Description', with: event.description
    fill_in 'Additional Info', with: event.notes
    click_on 'Submit'

    expect(page).to have_content('New Event Added!')
  end
end
