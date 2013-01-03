module GameOfLife
  class Blocks
    include Enumerable

    attr_writer :block_creator
    def initialize(rows)
      @rows = rows
    end

    def size
      @rows.size
    end

    def evolve(board)
      self.each do |block|
        board.add_row block.evolve
      end
    end

    def each(&block)
      @rows.each do |row|
        block.call self.block_creator.call(row, self)
      end
    end

    def block_creator
      @block_creator ||= Block.method(:new)
    end
  end
end
