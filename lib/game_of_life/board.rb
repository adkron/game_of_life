class GameOfLife::Board
  def self.from_string(string)
    self.new
  end

  def initialize
  end

  def evolve
    self
  end

  def to_s
    ' '
  end
end
