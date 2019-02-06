require 'spec_helper'
require 'rails_helper'

feature 'admin can add a new horse' do
  scenario 'admin can see link to add a new horse when they login' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'

    expect(page).to have_content('Add New Horse')
  end

  scenario 'admin clicks on link Add New Horse and is redirected to a form' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Horse'

    expect(page).to have_content('Add New Horse')
  end

  scenario 'specifying valid and required information' do
    veterinarian = FactoryBot.create(:veterinarian)
    farrier = FactoryBot.create(:farrier)
    user = FactoryBot.create(:user)
    horse = FactoryBot.create(:horse, user: user, veterinarian: veterinarian, farrier: farrier)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Horse'
    fill_in 'Registered Name', with: horse.registered_name
    fill_in 'Barn Name', with: horse.barn_name
    fill_in 'Breed', with: horse.breed
    fill_in 'Discipline', with: horse.discipline
    select user.name, from: 'Owner'
    select veterinarian.name, from: 'Veterinarian'
    select farrier.name, from: "Farrier"
    attach_file 'horse_picture', "#{Rails.root}/spec/support/images/photo.jpg"
    click_on 'Submit'

    expect(page).to have_content('New Horse Added!')
  end
end
