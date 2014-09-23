require_relative 'display'
require_relative 'color_sequence'
require_relative 'board'

class Game
  attr_reader :round,
              :history,
              :board

  def initialize
    @history               = []
    @round                 = 0
    @final_sequence        = ColorSequence.new
    @pretty_final_sequence = Display.colorful(@final_sequence.colors)
    @board                 = Board.new
    @guess                 = ''
    @finished              = false
  end

  def start
    board.show
    game_loop
  end

  def game_loop
    until finished?
      get_input
      valid_input? ? play_round : invalid_input(@guess)
    end
    game_over
  end

  def play_round
    @round += 1
    @history << @final_sequence.guess(@guess)
    update_board
    show_round_result(@history.last)
  end

  def win?
    @history.last[:positions] == 4 if round > 0
  end

  def quit?
    @guess == 'q' || @guess == 'quit'
  end

  def finished?
    round >= 10 || quit? || win?
  end

  def show_round_result(round_result)
    Display.round_result(round_result, round)
  end

  def get_input
    Display.enter_guess
    @guess = gets.chomp.downcase
  end


  def update_board
    Display.mastermind
    @finished ? finish_board : edit_board
    board.show
  end

  def finish_board
    board.finished(round, history, @pretty_final_sequence)
  end

  def edit_board
    board.edit_row(round, history)
  end

  def instructions
    Display.instructions
  end

  def valid_input?
    (@guess.length == 4) && (@guess.scan(/[^rgby]/).length == 0)
  end

  def invalid_input(input)
    input == 'q' || input == 'quit' ? return : Display.invalid_input(input)
  end

  def game_over
    @finished = true
    update_board
    win? ? Display.winner : Display.loser
  end

end
