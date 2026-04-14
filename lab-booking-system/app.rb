require_relative 'lib/errors'
require_relative 'lib/user'
require_relative 'lib/resource'
require_relative 'lib/booking'
require_relative 'lib/booking_manager'

puts "=== Lab Booking System Demo ==="
puts

# Step 1: Create users
puts "-- Creating Users --"
student   = User.new(id: 1, name: "Alice", role: "student")
assistant = User.new(id: 2, name: "Bob",   role: "assistant")
puts "Created user: #{student.name} (#{student.role})"
puts "Created user: #{assistant.name} (#{assistant.role})"
puts

# Step 2: Create resources
puts "-- Creating Resources --"
microscope = Resource.new(id: 1, name: "Microscope", category: "Biology")
laptop     = Resource.new(id: 2, name: "Laptop",     category: "Computing")
puts "Created resource: #{microscope.name} (#{microscope.category}) — available: #{microscope.available?}"
puts "Created resource: #{laptop.name} (#{laptop.category}) — available: #{laptop.available?}"
puts

# Step 3: Create a valid booking
puts "-- Creating a Valid Booking --"
manager = BookingManager.new
booking1 = Booking.new(user: student, resource: microscope)
manager.add(booking1)
puts "Booking created: #{student.name} booked #{microscope.name}"
puts "Booking status: #{booking1.status}"
puts "Microscope available? #{microscope.available?}"
puts

# Step 4: Attempt a conflicting booking for the same resource
puts "-- Attempting a Conflicting Booking --"
begin
  conflicting = Booking.new(user: assistant, resource: microscope)
rescue ResourceUnavailableError => e
  puts "Caught ResourceUnavailableError: #{e.message}"
end
puts

# Step 5: Cancel the first booking and verify resource is available again
puts "-- Cancelling the First Booking --"
booking1.cancel!
puts "Booking status after cancellation: #{booking1.status}"
puts "Microscope available? #{microscope.available?}"
puts

puts "=== Demo Complete ==="
