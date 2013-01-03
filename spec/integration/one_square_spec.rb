require_relative 'spec_helper'

describe 'A One Square Board' do
  context 'that is dead' do
    subject do
      GameOfLife::Board.from_string ' '
    end

    it 'is still dead after one evolution' do
      subject.evolve.to_s.should == ' '
    end
  end

  context 'that is alive' do
    subject do
      GameOfLife::Board.from_string '*'
    end

    it 'is still dead after one evolution' do
      subject.evolve.to_s.should == ' '
    end
  end
end
