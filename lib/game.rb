# frozen_string_literal: false

class Game
  def verify_input(input)
    return input if input.match?(/c[1-7]/)
  end

  private

  def player_input
    puts "Type in a column between \e[32m[c1]\e[0m and \e[32m[c7]\e[0m:"
  end
end
