require 'rails_helper'

RSpec.feature "User without session visits /tickets/new:", :type => :feature do
  scenario "User is prompted to log in" do
    visit "/tickets/new"

    expect(page).to have_content("Log in") 
  end
end

RSpec.feature "User is able to login and create tickets:", :type => :feature do
  before :each do
    user = User.create!(:email => "panda@example.com", :password => "password12", :password => "password12")
  end

  scenario "session is created" do
    visit "/tickets/new"
    within("#new_user") do
      fill_in 'user_email', :with => "panda@example.com"
      fill_in 'user_password', :with => "password12"
    end

    click_button 'Log in'
    expect(page).to have_content('Signed in')
  end

  scenario "tickets are persisted" do
    visit "/tickets/new"

    within("#new_user") do
      fill_in 'user_email', :with => "panda@example.com"
      fill_in 'user_password', :with => "password12"
    end

    click_button 'Log in'

    within("#new_ticket") do
      fill_in "Event", :with => "USC at UCLA"
      fill_in "Location", :with => "Westwood, CA"
      fill_in "Quantity", :with => "1"
      select 'August' 
      select '5'
      select '2015'
      fill_in "Description", :with => "Section 109, Row B. Both seats are together. Looking to trade these tickets for tickets to a different ucla game or Lakers game. Only interested in lower level seats."
    end

    click_button 'Create listing'
    expect(page).to have_text("Section 109, Row B.")
  end
end
  
RSpec.feature "Ticket values are validated:", :type => :feature do

  before :each do
    user = User.create!(:email => "panda@example.com", :password => "password12", :password => "password12")
  end

  scenario "Form with empty values does not persist" do
    visit "/tickets/new"

    within("#new_user") do
      fill_in 'user_email', :with => "panda@example.com"
      fill_in 'user_password', :with => "password12"
    end

    click_button 'Log in'
    click_button 'Create listing'

    expect(page).to have_text("Prohibited this listing from being saved:")
  end
end


RSpec.feature "Displays error messages to user:", :type => :feature do

  before :each do 
    user = User.create!(:email => "panda@example.com", :password => "password12", :password => "password12")
  end

  scenario "Shows error message for invalid email address" do
    visit "/tickets/new"
    within("#new_user") do
      fill_in 'user_email', :with => "panda@example.com"
      fill_in 'user_password', :with => "password12"
    end

    click_button 'Log in'

    within("#new_ticket") do
      fill_in "ticket_event", :with => "USC at UCLA"
      fill_in "ticket_location", :with => "Westwood, CA"
      fill_in "ticket_quantity", :with => "1"
      select '1'
      select '2'
      select '2015'
      fill_in "ticket_email", :with => "exampleexample.com"
      fill_in "ticket_description", :with => "Section 109, Row B. Both seats are together. Looking to trade these tickets for tickets to a different ucla game or Lakers game. Only interested in lower level seats."
    end
    click_button 'Create listing'
    expect(page).to have_text("Email is invalid")
  end

  scenario "Shows error message for non integer ticket quantity" do
    visit "/tickets/new"

    within("#new_user") do
      fill_in 'user_email', :with => "panda@example.com"
      fill_in 'user_password', :with => "password12"
    end

    click_button 'Log in'

    within("#new_ticket") do
      fill_in "ticket_event", :with => "USC at UCLA"
      fill_in "ticket_location", :with => "Westwood, CA"
      fill_in "ticket_quantity", :with => "SN"
      select 'August'
      select '2'
      select '2015'
      fill_in "ticket_email", :with => "example@example.com"
      fill_in "ticket_description", :with => "Section 109, Row B. Both seats are together. Looking to trade these tickets for tickets to a different ucla game or Lakers game. Only interested in lower level seats."
    end

    click_button 'Create listing'
    expect(page).to have_text("Quantity is not a number")
  end

end 
