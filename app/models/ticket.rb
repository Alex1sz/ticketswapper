class Ticket < ActiveRecord::Base
  validates :event, :date, :location, presence: true

  validates :quantity, numericality: { only_integer: true,
                                       greater_than: 0,
                                       less_than: 100  }
  validates :description, length: { in: 20..400 }
  validates_format_of :email, :with => /@/
end
