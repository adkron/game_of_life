require_relative 'spec_helper'

describe 'A One Square Board' do
  let(:dead_game) { GameOfLife::Game.new Board.new(Row.new(DeadCell.new)) }
  let(:live_game) { GameOfLife::Game.new Board.new(Row.new(LiveCell.new)) }

  context 'that is dead' do
    subject { dead_game }

    it 'is still dead after one evolution' do
      subject.evolve.should == dead_game
    end
  end

  context 'that is alive' do
    subject { live_game }

    it 'is still dead after one evolution' do
      subject.evolve.should == dead_game
    end
  end
end
