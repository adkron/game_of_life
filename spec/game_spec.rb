require_relative 'spec_helper'

require 'game_of_life/game'

describe GameOfLife::Game do
  it 'evolving steps the board' do
    board = mock

    subject = described_class.new(board)

    board.should_receive(:step)
    subject.evolve
  end

  context 'two games with the same board' do
    let(:board) { mock }
    subject { described_class.new board }
    let(:other_game) { described_class.new board}
    it 'are equal' do
      subject.should be_eql other_game
    end
  end
end
