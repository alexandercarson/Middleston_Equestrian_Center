require 'spec_helper'
require 'rails_helper'


feature 'admin can add a new farrier' do
  scenario 'admin can see link to add a new farrier when they login' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'

    expect(page).to have_content('Add New Farrier')
  end

  scenario 'admin clicks on link Add New Farrier and is redirected to a form' do
    user = FactoryBot.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Farrier'

    expect(page).to have_content('Add New Farrier')
  end

  scenario 'admin can add a new farrier' do
    user = FactoryBot.create(:user)
    farrier = FactoryBot.create(:farrier)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log In'
    click_on 'Add New Farrier'
    fill_in 'Name', with: farrier.name
    fill_in 'Phone Number', with: farrier.phone_number
    fill_in 'Address', with: farrier.address
    fill_in 'City', with: farrier.city
    fill_in 'State', with: farrier.state
    fill_in 'Zip Code', with: farrier.zip_code
    click_on 'Submit'

    expect(page).to have_content('New Farrier Added!')
  end
end
