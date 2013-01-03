require_relative 'spec_helper'

require 'game_of_life/blocks'

describe GameOfLife::Blocks do
  context 'with one row' do
    let(:row) { mock }
    let(:block_class) { Struct.new :row, :blocks }
    let(:block_creator) { block_class.method(:new) }
    subject do
      s = described_class.new [row]
      s.block_creator = block_creator
      s
    end

    its(:count) { should be 1 }

    it 'has one block created with three of the same row' do
      subject.first.should == block_class.new(row, subject)
    end

    describe 'evolving' do
      it 'adds a row from the evolved block to the board' do
        evolved_row = mock 'evolved row'
        block = mock('block', evolve: evolved_row)
        subject.block_creator = ->(row, blocks) { block }

        board = mock
        board.should_receive(:add_row).with(evolved_row)

        subject.evolve board
      end
    end
  end

  context 'with two rows' do
    let(:row1) { mock }
    let(:row2) { mock }
    let(:block_class) { Struct.new :row1, :blocks }
    let(:block_creator) { block_class.method(:new) }
    subject do
      s = described_class.new [row1, row2]
      s.block_creator = block_creator
      s
    end

    its(:count) { should be 2 }
    describe 'evolving' do
      it 'adds a row from each evolved block to the board' do
        evolved_row = mock
        block = mock('block', evolve: evolved_row)
        subject.block_creator = ->(row, blocks) { block }

        board = mock
        board.should_receive(:add_row).with(evolved_row).twice

        subject.evolve board
      end
    end
  end
end
