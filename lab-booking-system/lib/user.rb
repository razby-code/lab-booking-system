require_relative 'errors'
require_relative 'constants'

class User
  attr_reader :id, :name, :role

  def initialize(id:, name:, role:)
    unless Roles::ALL.include?(role)
      raise InvalidRoleError, "Invalid role '#{role}'. Must be student, assistant, or admin"
    end

    @id   = id
    @name = name
    @role = role
  end
end
