module GameOfLife
  class Game
    attr_reader :board

    def initialize(board)
      @board = board
    end

    def evolve
      @board = @board.step
    end

    def hash
      @board.hash
    end

    def eql?(other)
      @board.eql? other.board
    end
  end
end
