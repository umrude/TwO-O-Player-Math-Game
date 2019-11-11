# frozen_string_literal: true

require './player.rb'
require './questions.rb'

class Main
  attr_accessor :playerturn
  def initialize
    @cur_player = 'Player 1'
    @player_1 = Player.new
    @player_2 = Player.new

    @player_1_lives = "#{@player_1.lives}/3"
    @player_2_lives = "#{@player_2.lives}/3"
    new_turn
  end

  def new_turn
    puts '----- NEW TURN -----'
    new_question = Question.new(@cur_player)

    lose_life unless new_question.right

    if @cur_player == 'Player 1'
      @cur_player = 'Player 2'
    elsif @cur_player == 'Player 2'
      @cur_player = 'Player 1'
    end

    puts "P1: #{@player_1_lives} vs P2: #{@player_2_lives}"

    check_game
  end

  def check_game
    if @player_1.lives != 0 && @player_2.lives != 0
      new_turn
    elsif (@player_1.lives == 0) || (@player_2.lives == 0)
      puts '----- GAME OVER -----'
      puts 'Good bye!'
      if @player_1.lives != 0
        puts "Player 1 wins with a score of #{@player_1_lives}"
      else
        puts "Player 2 wins with a score of #{@player_2_lives}"
      end
      end
  end

  def lose_life
    if @cur_player == 'Player 1'
      @player_1.lose
      @player_1_lives = "#{@player_1.lives}/3"

    elsif @cur_player == 'Player 2'
      @player_2.lose
      @player_2_lives = "#{@player_2.lives}/3"

    end
  end
end

game = Main.new
