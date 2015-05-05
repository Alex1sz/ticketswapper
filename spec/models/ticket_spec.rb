require 'rails_helper'

RSpec.describe Ticket do

  let(:valid_attributes) {
    { quantity: 5,
      date: 3.days.from_now,
      email: "example@example.com",
      location: "new york, ny",
      event: "Cool thing",
      user_id: 1,
      description: "Row 3, Section 15. Looking to trade these tickets to either Cool thing weekend 2 or a Lakers game. For Lakers I'd want lower level seats and at least two tickets." }
  }

  subject(:ticket) { Ticket.create(valid_attributes) }
  
  it "creates when all attributes are valid" do
    expect(ticket).to be_persisted
  end

  describe "Validations" do
  
    it "validates numericality of quantity" do
      valid_attributes[:quantity] = "five"
      expect(ticket.errors).to have_key(:quantity)
    end

    it "does not accept a value less than 0 for quantity" do
      valid_attributes[:quantity] = "0"
      expect(ticket.errors).to have_key(:quantity)
    end

    it "rejects negative values for quantity" do
      valid_attributes[:quantity] = "-1"
      expect(ticket.errors).to have_key(:quantity)
    end

    it "does not accept values above 99 for quantity" do
      valid_attributes[:quantity] = "100"
      expect(ticket.errors).to have_key(:quantity)
    end

    it "does not accept an empty value for date" do
      date = ""
      email = "example@example.com"
      description = "Section 10, row 4. Looking to trade this set of tickets for a different we2 tourdate"
      ticket = Ticket.create(event: "Fyf", date: date, quantity: "1", location: "bangor, me", description: description, email: email)
      expect(ticket).not_to be_valid
    end

    it "validates length of description and does not accept descriptions with lengths less than 20" do
      date = Date.new(2015,4,10)
      quantity = "1"
      email = "example@example.com"
      description = "hip"
      ticket = Ticket.create(quantity: quantity, event: "UGK", date: date, location: "nyc", description: description, email: email)
      expect(ticket).not_to be_valid
    end

#    it "does not accept a description with a length greater than 2000" do
#      date = Date.new(2015,4,10)
#      quantity = "1"
#      email = "example@example.com"
#      description = "Really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description really long description"
#      ticket = Ticket.create(quantity: quantity, event: "UGK", date: date, location: "nyc", description: description, email: email)
#      expect(ticket).not_to be_valid
 #   end

    it "does not accept an email address that does not include @" do
      date = Date.new(2015,4,10)
      email = "example$example.com"
      description = "Section 10, row 4. Looking to trade this set of tickets for a different we2 tourdate"
      ticket = Ticket.create(quantity: "1", event: "UGK", date: date, location: "nyc", description: description, email: email)
      expect(ticket).not_to be_valid
    end
  end
end
