class Ticket < ActiveRecord::Base
  belongs_to :user

  validates :event, :date, :location, presence: true

  validates :quantity, numericality: { only_integer: true,
                                       greater_than: 0,
                                       less_than: 100  }
  validates :description, length: { in: 20..2000 }
  validates_format_of :email, :with => /@/

  before_save :set_searchable_content

  def set_searchable_content
    self.searchable_content = self.event + " " + self.description + " " + self.location + " " + self.email
  end

  searchable do 
    text :searchable_content, :boost => 2.0
    string :location
    string :email
    string :event
  end

  def self.search_ticket(query)
    @search = self.search do
      fulltext "#{query}"
    end
    @tickets = @search.results
  end
end
