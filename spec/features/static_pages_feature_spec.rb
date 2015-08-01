require 'rails_helper'

RSpec.feature "Has link to tickets pages:", :type => :feature do
  scenario "user visits" do 
    visit "/"

    expect(page).to have_link("View Tickets")
    expect(page).to have_link("Add Tickets")
  end
end

RSpec.feature "Description of how TicketSwapper works", :type => :feature do 
  scenario "description is visible" do 
    visit "/"

    expect(page).to have_text("How it works:")
  end
end

RSpec.feature "homepage View Tickets links to Ticket Index", :type => :feature do 
  scenario "User clicks on View Tickets link" do 
    visit "/"
    click_link("View Tickets")

    expect(page).to have_text("Tickets Index")
  end
end
