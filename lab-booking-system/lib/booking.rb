require_relative 'errors'
require_relative 'constants'

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    if user.role == Roles::ADMIN
      raise UnauthorizedRoleError, "Admin users are not permitted to create bookings"
    end

    unless resource.available?
      raise ResourceUnavailableError, "Resource '#{resource.name}' is not available"
    end

    @user       = user
    @resource   = resource
    @status     = BookingStatus::ACTIVE
    @created_at = Time.now

    resource.mark_unavailable!
  end

  def cancel!
    if @status == BookingStatus::CANCELLED
      raise AlreadyCancelledError, "Booking is already cancelled"
    end

    @status = BookingStatus::CANCELLED
    @resource.mark_available!
  end
end
