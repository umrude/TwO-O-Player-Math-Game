# frozen_string_literal: true

class Question
  attr_accessor :right
  def initialize(player)
    @num1 = rand(-10..10)
    @num2 = rand(-10..10)
    @ans = @num1 + @num2
    puts "#{player}: What does #{@num1} plus #{@num2} equal?"
    question
  end

  def question
    @answer = gets.chomp
    if @answer.to_i == @ans
      puts 'Correct!'
      @right = true
    else
      puts 'Nah dude'
      @right = false
    end
  end
end
