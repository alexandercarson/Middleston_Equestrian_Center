require 'spec_helper'
require 'rails_helper'

feature 'admin can add a new veterinarian' do
  scenario 'admin can see link to add a new veterinarian when they login' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'

    expect(page).to have_content('Add New Veterinarian')
  end

  scenario 'admin clicks on link Add New Veterinarian and is redirected to a form' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Veterinarian'

    expect(page).to have_content('Add New Veterinarian')
  end

  scenario 'admin can add a new veterinarian' do
    user = FactoryBot.create(:user)
    veterinarian = FactoryBot.create(:farrier)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Veterinarian'
    fill_in 'Name', with: veterinarian.name
    fill_in 'Phone Number', with: veterinarian.phone_number
    fill_in 'Address', with: veterinarian.address
    fill_in 'City', with: veterinarian.city
    fill_in 'State', with: veterinarian.state
    fill_in 'Zip Code', with: veterinarian.zip_code
    click_on 'Submit'

    expect(page).to have_content('New Veterinarian Added!')
  end
end
