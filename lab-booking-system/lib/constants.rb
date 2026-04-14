module Roles
  STUDENT   = "student"
  ASSISTANT = "assistant"
  ADMIN     = "admin"
  ALL       = [STUDENT, ASSISTANT, ADMIN].freeze
  BOOKABLE  = [STUDENT, ASSISTANT].freeze
end

module BookingStatus
  ACTIVE    = "active"
  CANCELLED = "cancelled"
end
