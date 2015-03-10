require 'rails_helper'

RSpec.feature "homepage has links to ticket pages", :type => :feature do
  scenario "user views homepage and sees tickets links" do 
    visit "/"

    expect(page).to have_link("View Tickets")
    expect(page).to have_link("Add Tickets")
  end
end

RSpec.feature "homepage has description of how TicketSwapper works", :type => :feature do 
  scenario "User sees TicketSwapper description on homepage" do 
    visit "/"

    expect(page).to have_text("How TicketSwapper works")
  end
end

RSpec.feature "homepage View Tickets links to Ticket Index", :type => :feature do 
  scenario "User clicks on View Tickets link" do 
    visit "/"
    click_link("View Tickets")

    expect(page).to have_text("Ticket Index")
  end
end

RSpec.feature "homepage Add Tickets links to tickets/new", :type => :feature do 
  scenario "User on homepage clicks on Add Tickets link" do 
    visit "/" 
    click_link("Add Tickets")

    expect(page).to have_text("Add Tickets")
  end
end
