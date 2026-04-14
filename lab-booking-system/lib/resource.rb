class Resource
  attr_reader :id, :name, :category

  def initialize(id:, name:, category:)
    @id = id
    @name = name
    @category = category
    @available = true
  end

  def available?
    @available
  end

  def mark_unavailable!
    @available = false
  end

  def mark_available!
    @available = true
  end
end
