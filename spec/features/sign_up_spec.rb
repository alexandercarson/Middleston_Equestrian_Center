require 'spec_helper'
require 'rails_helper'

feature "sign up" do

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Name', with: 'Jon Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Phone Number', with: '123-456-7890'
    fill_in 'Address', with: '123 Main St'
    fill_in 'City', with: 'Lincoln'
    fill_in 'State', with: 'Nebraska'
    fill_in 'Zip Code', with: '68506'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Account was successfully created")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Sign Out"

  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user_password', with: 'password'
    fill_in 'Password Confirmation', with: 'somethingDifferent'

    click_on 'Sign Up'

    expect(page).to have_content "doesn't match Password"
    expect(page).to_not have_content "Sign Out"

  end
end
