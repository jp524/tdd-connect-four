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

  describe '#add_to_board' do
    context 'when a column is given as an argument' do
      it 'adds a marker if column is empty' do
        column = board.instance_variable_get(:@c1)
        expect { board.add_to_board('c1') }
          .to change { column }
          .from([' ', ' ', ' ', ' ', ' ', ' '])
          .to(['X', ' ', ' ', ' ', ' ', ' '])
      end

      it 'adds a marker if already has elements in it ' do
        board.instance_variable_set(:@c1, ['O', 'X', 'O', ' ', ' ', ' '])
        column = board.instance_variable_get(:@c1)
        expect { board.add_to_board('c1') }
          .to change { column }
          .from(['O', 'X', 'O', ' ', ' ', ' '])
          .to(['O', 'X', 'O', 'X', ' ', ' '])
      end

      it 'puts an error message if column is already full ' do
        board.instance_variable_set(:@c1, %w[O X O X O X])
        column = board.instance_variable_get(:@c1)
        expect { board.add_to_board('c1') }.not_to(change { column })
        error_message = "Column is already full.\n"
        expect { board.add_to_board('c1') }.to output(error_message).to_stdout
      end
    end
  end
end
