# frozen_string_literal: false

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    context 'when game is initialized' do
      it 'creates an empty column c1' do
        expect(board.instance_variable_get(:@c1)).to eq([' ', ' ', ' ', ' ', ' ', ' '])
      end

      it 'creates seven empty columns' do
        empty_column = [' ', ' ', ' ', ' ', ' ', ' ']
        expect(board.instance_variable_get(:@c1)).to eq(empty_column)
        expect(board.instance_variable_get(:@c2)).to eq(empty_column)
        expect(board.instance_variable_get(:@c3)).to eq(empty_column)
        expect(board.instance_variable_get(:@c4)).to eq(empty_column)
        expect(board.instance_variable_get(:@c5)).to eq(empty_column)
        expect(board.instance_variable_get(:@c6)).to eq(empty_column)
        expect(board.instance_variable_get(:@c7)).to eq(empty_column)
      end
    end
  end
end
