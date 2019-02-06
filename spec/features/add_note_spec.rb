require 'spec_helper'
require 'rails_helper'

feature 'admin can add a new note' do
  scenario 'admin can see link to owner info login' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'

    expect(page).to have_content('Add New Note')
  end

  scenario 'admin clicks on link Add New Note and is redirected to a form' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Note'

    expect(page).to have_content('Add New Note')
  end

  scenario 'admin can add a new note' do
    user = FactoryBot.create(:user)
    veterinarian = FactoryBot.create(:veterinarian)
    farrier = FactoryBot.create(:farrier)
    horse = FactoryBot.create(:horse, user: user, veterinarian: veterinarian, farrier: farrier)
    note = FactoryBot.create(:note, horse: horse)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Note'
    select horse.barn_name, from: 'Horse'
    fill_in 'Enter Note', with: note.text
    click_on 'Submit'

    expect(page).to have_content('New Note Added!')
  end
end
