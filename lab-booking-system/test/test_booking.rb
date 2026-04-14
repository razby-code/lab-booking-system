require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/user"
require_relative "../lib/resource"
require_relative "../lib/booking"
require_relative "../lib/booking_manager"

class BookingTest < Minitest::Test

  def setup
    @user      = User.new(id: 1, name: "Mahi",  role: "student")
    @assistant = User.new(id: 2, name: "Alex",  role: "assistant")
    @admin     = User.new(id: 3, name: "Admin", role: "admin")
    @resource  = Resource.new(id: 1, name: "Microscope", category: "lab")
  end

  # 1. booking an available resource creates an active booking
  def test_booking_an_available_resource
    booking = Booking.new(user: @user, resource: @resource)
    assert_equal "active", booking.status
    assert_equal false, @resource.available?
  end

  # 2. booking an unavailable resource raises an error
  def test_booking_unavailable_resource_raises_error
    Booking.new(user: @user, resource: @resource)
    assert_raises(ResourceUnavailableError) do
      Booking.new(user: @assistant, resource: @resource)
    end
  end

  # 3. cancelling a booking changes its status
  def test_cancelling_booking_changes_status
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel!
    assert_equal "cancelled", booking.status
  end

  # 4. cancelling a booking makes the resource available again
  def test_cancelling_booking_restores_resource
    booking = Booking.new(user: @user, resource: @resource)
    booking.cancel!
    assert @resource.available?
  end

end
