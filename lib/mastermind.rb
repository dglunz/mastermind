require_relative 'game'

  def start_menu
    input = ''
    Display.introduction
    input = get_input
    case input
      when 'p' || 'play' then Display.start; Game.new.start
      when 'i' || 'instructions' then Display.instructions
      when 'q' || 'quit' then Display.quit
      else Display.input_invalid(input)
    end
    puts "Play Again? (Y)es or (N)o"
    input = get_input
    input == 'y' || input == 'yes' ? start_menu : return
  end

  def get_input
    Display.enter
    input = gets.chomp.downcase
  end

start_menu
