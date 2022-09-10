# frozen_string_literal: false

# Contains the name and marker for a player
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end
