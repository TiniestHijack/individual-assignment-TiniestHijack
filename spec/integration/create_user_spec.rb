require 'spec_helper'
require 'rails_helper'

feature 'make purchase' do
scenario "make whole purchase" do
visit '/'
visit '/movies/2'

expect(page).to have_content('Purchases')   
click_link "Rent or Buy" 

expect(page).to have_content('Email')
click_link "Sign up now!"

expect(page).to have_content('New Customer')
fill_in 'Last name', :with => 'Harrison'
fill_in 'First name', :with => 'Sharon'
    click_button 'Create Customer'

expect(page).to have_content('Customer: Sharon Harrison')
fill_in 'Email', :with=>'s.harrison@gmail.com'
fill_in 'Password', :with=>'password'
fill_in 'Password confirmation', :with=>'password'
    click_button 'Create User'

expect(page).to have_content('User was successfully created.')
click_link "View Credit Cards"

expect(page).to have_content('Credit Cards')
click_link "New Credit Card"

expect(page).to have_content('New Credit Card')
fill_in 'Number', :with=>'8888666655554444'
select_date("2021,December,7", :from => "Exp date")
fill_in 'Name on card', :with=>'Sharon G Harrison'
select 'Visa', :from => 'Organisation'
    click_button 'Create Credit card'

expect(page).to have_content('Credit card was successfully created.')
click_link 'Our movies'

expect(page).to have_content('Title')
click_link 'Show'

expect(page).to have_content('Purchases')
click_link 'Rent or Buy'

expect(page).to have_content('Purchases')
select 'Rent', :from => 'Ownership'
    click_button 'Create Purchase'

expect(page).to have_content('New Payment')
select '8888666655554444', :from => 'Credit card'
    click_button 'Create Payment'

expect(page).to have_content('Payment was successfully created.')
click_link 'Back'

expect(page).to have_content('Sharon Harrison')
end
end