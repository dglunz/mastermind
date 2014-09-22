require_relative 'game'

  def start_menu
    Display.introduction
    input = get_input
    start_menu_options(input)
    play_again? ? start_menu : return
  end

  def start_menu_options(input)
    case input
    when 'p' || 'play' then play
    when 'i' || 'instructions' then instructions
    when 'q' || 'quit' then Display.quit
    else Display.input_invalid(input)
    end
  end

  def instructions
    Display.instructions
    input = get_input
    start_menu_options(input)
  end

  def play
    Display.start
    @game = Game.new.start
  end

  def play_again?
    puts "Play Again? (Y)es or (N)o"
    input = get_input
    input == 'y' || input == 'yes' ? true : false
  end

  def get_input
    input = ''
    Display.enter
    input = gets.chomp.downcase
  end

start_menu
