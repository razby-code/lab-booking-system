require_relative 'constants'

class BookingManager
  def initialize
    @bookings = []
  end

  def add(booking)
    @bookings << booking
  end

  def active_bookings
    @bookings.select { |b| b.status == BookingStatus::ACTIVE }
  end

  def available_resources(resources)
    resources.select(&:available?)
  end
end
