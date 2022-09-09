# frozen_string_literal: false

require_relative '../lib/game'
require_relative '../lib/board'

describe Game do
  describe '#verify_input' do
    subject(:game) { described_class.new }

    context 'when given a valid input as an argument' do
      it 'returns the input' do
        user_input = 'c2'
        result = game.verify_input(user_input)
        expect(result).to eq('c2')
      end
    end

    context 'when given an invalid input as an argument' do
      it 'returns nil' do
        user_input = 'c8'
        result = game.verify_input(user_input)
        expect(result).to eq(nil)
      end
    end

    context 'when given an invalid input as an argument' do
      it 'returns nil' do
        user_input = 'wrong2'
        result = game.verify_input(user_input)
        expect(result).to eq(nil)
      end
    end
  end

  describe '#player_turn' do
    subject(:game) { described_class.new }

    context 'when user input is valid' do
      it 'stops loop and does not display error message' do
        valid_input = 'c1'
        allow(game).to receive(:player_input).and_return(valid_input)
        expect(game).not_to receive(:puts).with('Invalid input.')
        game.player_turn
      end
    end

    context 'when user input is valid' do
      it 'stops loop and calls #add_to_board on Board instance' do
        board = game.instance_variable_get(:@board)
        valid_input = 'c1'
        allow(game).to receive(:player_input).and_return(valid_input)
        expect(board).to receive(:add_to_board).with('c1')
        game.player_turn
      end
    end

    context 'when user inputs invalid value, then a valid input' do
      it 'completes loop and display error message once' do
        valid_input = 'c1'
        invalid_input = 'c9'
        allow(game).to receive(:player_input).and_return(invalid_input, valid_input)
        expect(game).to receive(:puts).with('Invalid input.').once
        game.player_turn
      end
    end
  end
end
