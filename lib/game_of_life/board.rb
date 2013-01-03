module GameOfLife
  class Board
    attr_writer :blocks_initializer
    attr_reader :rows
    def initialize(rows = [])
      @rows = rows
    end

    def blocks
      self.blocks_initializer.call @rows
    end

    def evolve
      blocks.evolve Board.new
    end

    def blocks_initializer
      @blocks_initializer ||= Blocks.method(:new)
    end

    def ==(other)
      self.rows == other.rows
    end
  end
end
