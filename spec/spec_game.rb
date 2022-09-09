# frozen_string_literal: false

require_relative '../lib/game'

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
end
