# frozen_string_literal: false

require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    subject(:create_player) { described_class.new('Player 1', 'X') }

    context 'when Player is initialized' do
      it 'creates a player with a name and marker' do
        expect(create_player.instance_variable_get(:@name)).to eq('Player 1')
        expect(create_player.instance_variable_get(:@marker)).to eq('X')
      end
    end
  end
end
