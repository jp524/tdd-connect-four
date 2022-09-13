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
        expect { board.add_to_board('c1', 'X') }
          .to change { column }
          .from([' ', ' ', ' ', ' ', ' ', ' '])
          .to(['X', ' ', ' ', ' ', ' ', ' '])
      end

      it 'adds a marker if already has elements in it ' do
        board.instance_variable_set(:@c1, ['O', 'X', 'O', ' ', ' ', ' '])
        column = board.instance_variable_get(:@c1)
        expect { board.add_to_board('c1', 'X') }
          .to change { column }
          .from(['O', 'X', 'O', ' ', ' ', ' '])
          .to(['O', 'X', 'O', 'X', ' ', ' '])
      end

      it 'puts an error message if column is already full ' do
        board.instance_variable_set(:@c1, %w[O X O X O X])
        column = board.instance_variable_get(:@c1)
        expect { board.add_to_board('c1', 'X') }.not_to(change { column })
        error_message = "Column is already full.\n"
        expect { board.add_to_board('c1', 'X') }.to output(error_message).to_stdout
      end
    end
  end

  describe '#game_over?' do
    context 'when a winning vertical combination is on the board' do
      it 'is game over' do
        allow(board).to receive(:vertical_comb?).and_return(true)
        expect(board.game_over?('X')).to be(true)
      end
    end

    context 'when a winning horizontal combination is on the board' do
      it 'is game over' do
        allow(board).to receive(:horizontal_comb?).and_return(true)
        expect(board.game_over?('X')).to be(true)
      end
    end

    context 'when a winning diagonal combination is on the board' do
      it 'is game over' do
        allow(board).to receive(:diagonal_comb?).and_return(true)
        expect(board.game_over?('X')).to be(true)
      end
    end

    context 'when no winning combination is on the board' do
      it 'is not game over' do
        expect(board.game_over?('X')).to be(false)
      end
    end
  end

  describe '#vertical_comb?' do
    context 'when a winning vertical combination is on the board' do
      it 'returns true' do
        board.instance_variable_set(:@c1, ['X', 'X', 'X', 'X', ' ', ' '])
        expect(board.vertical_comb?('X')).to be(true)
      end
    end

    context 'when a winning vertical combination is on the board' do
      it 'returns true' do
        board.instance_variable_set(:@c7, [' ', 'X', 'X', 'X', 'X', ' '])
        expect(board.vertical_comb?('X')).to be(true)
      end
    end

    context 'when no winning vertical combination is on the board' do
      it 'returns false' do
        board.instance_variable_set(:@c3, [' ', ' ', 'X', 'X', 'X', ' '])
        expect(board.vertical_comb?('X')).to be(false)
      end
    end
  end

  describe '#horizontal_comb?' do
    context 'when a winning horizontal combination is on the board' do
      it 'returns true' do
        board.instance_variable_set(:@c1, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c2, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c3, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c4, ['X', ' ', ' ', ' ', ' ', ' '])
        expect(board.horizontal_comb?('X')).to be(true)
      end
    end

    context 'when a winning horizontal combination is on the board' do
      it 'returns true' do
        board.instance_variable_set(:@c4, [' ', ' ', ' ', ' ', ' ', 'X'])
        board.instance_variable_set(:@c5, [' ', ' ', ' ', ' ', ' ', 'X'])
        board.instance_variable_set(:@c6, [' ', ' ', ' ', ' ', ' ', 'X'])
        board.instance_variable_set(:@c7, [' ', ' ', ' ', ' ', ' ', 'X'])
        expect(board.horizontal_comb?('X')).to be(true)
      end
    end

    context 'when no winning horizontal combination is on the board' do
      it 'returns false' do
        board.instance_variable_set(:@c1, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c2, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c3, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c4, [' ', ' ', ' ', ' ', ' ', ' '])
        expect(board.horizontal_comb?('X')).to be(false)
      end
    end
  end

  describe '#diagonal_comb?' do
    context 'when a winning diagonal combination is on the board' do
      it 'returns true' do
        board.instance_variable_set(:@c1, ['X', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c2, [' ', 'X', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c3, [' ', ' ', 'X', ' ', ' ', ' '])
        board.instance_variable_set(:@c4, [' ', ' ', ' ', 'X', ' ', ' '])
        expect(board.diagonal_comb?('X')).to be(true)
      end
    end

    context 'when a winning diagonal combination is on the board' do
      it 'returns true' do
        board.instance_variable_set(:@c4, [' ', 'X', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c5, [' ', ' ', 'X', ' ', ' ', ' '])
        board.instance_variable_set(:@c6, [' ', ' ', ' ', 'X', ' ', ' '])
        board.instance_variable_set(:@c7, [' ', ' ', ' ', ' ', 'X', ' '])
        expect(board.diagonal_comb?('X')).to be(true)
      end
    end

    context 'when no winning diagonal combination is on the board' do
      it 'returns false' do
        board.instance_variable_set(:@c4, [' ', ' ', ' ', ' ', ' ', ' '])
        board.instance_variable_set(:@c5, [' ', ' ', 'X', ' ', ' ', ' '])
        board.instance_variable_set(:@c6, [' ', ' ', ' ', 'X', ' ', ' '])
        board.instance_variable_set(:@c7, [' ', ' ', ' ', ' ', 'X', ' '])
        expect(board.diagonal_comb?('X')).to be(false)
      end
    end
  end
end
