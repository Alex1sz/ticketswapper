require 'rails_helper'

RSpec.feature "adding a ticket", :type => :feature do
  scenario "User creates a new ticket" do 
    visit "/tickets/new"

    fill_in "Event", :with => "USC at UCLA"
    fill_in "Location", :with => "Westwood, CA"
    fill_in "Quantity", :with => "2"
    fill_in "Email", :with => "example@example.com"
    fill_in "Description", :with => "Section 109, Row B. Both seats are together. Looking to trade these tickets for tickets to a different ucla game or Lakers game. Only interested in lower level seats."
    click_button "Create listing"

    expect(page).to have_text("Section 109, Row B.")
  end
end

RSpec.feature "renders new on failed create ticket form submission" do 
  scenario "User submits new ticket form with invalid values" do 
    visit "/tickets/new"
    click_button "Create listing"

    expect(page).to have_text("Add Tickets")
  end
end