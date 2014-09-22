require_relative 'game'
class CLI
  attr_reader :input

  def start_menu
    Display.introduction
    @input = get_input
    start_menu_options
    play_again? ? start_menu : return
  end

  def start_menu_options
    case
    when play? then play
    when instructions? then instructions
    when quit? then quit
    else Display.invalid_input(@input)
    end
  end

  def instructions
    display = Display
    Display.instructions
    @input = get_input
    start_menu_options
  end

  def quit
    Display.quit
    exit
  end

  def play?
    input == 'p' || input == 'play'
  end

  def instructions?
    input == 'i' || input == 'instructions'
  end

  def quit?
    input == 'q' || input == 'quit'
  end

  def play
    Display.start
    @game = Game.new.start
  end

  def play_again?
    puts "Play Again? (Y)es or (N)o"
    @input = get_input
    input == 'y' || input == 'yes' ? true : false
  end

  def get_input
    @input = ''
    Display.enter
    @input = gets.chomp.downcase
  end
end
