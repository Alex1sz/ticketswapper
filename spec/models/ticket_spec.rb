require 'rails_helper'

RSpec.describe Ticket do

  describe "class of quantity" do
    
    it "creates quantity as an integer" do
      quantity = "5"
      date = Date.new(2015,5,20)
      venue = "McHale Center"
      event = "Stanford at Arizona"
      section = "a"
      row = "2"
      location = "Tucson, az"
      ticket = Ticket.create(quantity: quantity, date: date, event: event, section: section, row: row, location: location, venue: venue)
      expect(ticket.quantity.class).to be(Fixnum)
    end
  end


  describe "Validations" do

    it "validates numericality of quantity" do
      quantity = "five"
      ticket = Ticket.create(quantity: quantity)
      expect(ticket).not_to be_valid
    end

    it "validates low range of quantity" do 
      quantity = "0"
      date = Date.new(2015,3,14)
      venue = "house of blues"
      location = "san diego, ca"
      ticket = Ticket.create(quantity: quantity, event: "we2", date: date, section: "a", row: "1", venue: venue, location: location)
      expect(ticket).not_to be_valid
    end

    it "rejects negative numbers for quantity" do
      quantity = "-1"
      date = Date.new(2015,4,1)
      venue = "rose bowl"
      location = "pasadena, ca"
      ticket = Ticket.create(quantity: quantity, event: "se1", date: date, section: "c", row: "2", venue: venue, location: location)
      expect(ticket).not_to be_valid
    end

    it "validates high range of quantity" do
      quantity = "100"
      date = Date.new(2015,4,19)
      venue = "the paradise"
      location = "boston, ma"
      ticket = Ticket.create(quantity: quantity, event: "UGK", date: date, section: "GA", row: "ga", venue: venue, location: location)
      expect(ticket).not_to be_valid
    end

    it "validates presence of row" do
      row = ""
      date = Date.new(2015,1,3)
      event = "paul mccartney"
      location = "los angeles, ca"
      venue = "staples center"
      ticket = Ticket.create(event: event, date: date, quantity: "1", section: "109A", row: row, venue: venue, location: location)
      expect(ticket).not_to be_valid
    end

    it "validates presence of venue" do 
      date = Date.new(2015,1,3)
      location = "foxboro, ma"
      venue = ""
      ticket = Ticket.create(event: "mvp", date: date, quantity: "1", section: "133B", row: "1", venue: venue, location: location)
      expect(ticket).not_to be_valid
    end

    it "validates presence of date" do
      date = ""
      ticket = Ticket.create(event: "Fyf", date: date, quantity: "1", section: "10", row: "GA", venue: "hifi", location: "bangor, me")
      expect(ticket).not_to be_valid
    end

    it "validates presence of section" do
      date = Date.new(2015,3,14)
      section = ""
      ticket = Ticket.create(event: "fyf", date: date, quantity: "1", section: section, row: "GA", venue: "hifi", location: "tucson, az")
      expect(ticket).not_to be_valid
    end
  end
end
