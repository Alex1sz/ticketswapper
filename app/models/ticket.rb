class Ticket < ActiveRecord::Base
  validates :event, :venue, :date, :section, :row, :location, presence: true

  validates :quantity, numericality: { only_integer: true,
                                      greater_than: 0,
                                      less_than: 100  }
  validates :notes, length: { in: 10..250 }

end
