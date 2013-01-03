require_relative 'spec_helper'

require 'game_of_life/board'

describe GameOfLife::Board do
  it 'creats blocks with the rows' do
    blocks_initializer = ->(rows) { rows }
    mock_rows = mock
    subject = described_class.new mock_rows
    subject.blocks_initializer = blocks_initializer

    subject.blocks.should == blocks_initializer.call(mock_rows)
  end

  it 'evolve evolves blocks with a new board' do
    blocks = mock
    blocks_initializer = ->(rows) { blocks }
    new_board = described_class.new

    subject = described_class.new
    subject.blocks_initializer = blocks_initializer
    blocks.should_receive(:evolve).with(described_class.new)

    subject.evolve
  end

end
