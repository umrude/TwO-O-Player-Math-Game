# frozen_string_literal: true

class Player
  attr_accessor :lives
  def initialize
    @lives = 3
  end

  def lose
    @lives -= 1
  end
end
