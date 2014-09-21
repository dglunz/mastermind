require 'rainbow'

module Display
  def self.colorful(sequence)
    sequence.split("").map do |letter|
      case letter
        when 'r' then Rainbow(letter).red
        when 'g' then Rainbow(letter).green
        when 'b' then Rainbow(letter).blue
        when 'y' then Rainbow(letter).yellow
        when 'w' then Rainbow(letter).white
        when 'b' then Rainbow(letter).black
        else letter
      end
    end.join("")
  end
  def self.introduction
    mastermind
    printf "Welcome!\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def self.instructions
    mastermind
    puts "
    \n
    A secret combination of colors has been chosen at random.\n
    Your job is to guess the correct sequence in 10 tries or less.\n
    If you manage to win, you'll be regarded as a mastermind.\n
    The only penalty for losing is self loathing.\n
    And knowing you've let your friends and family down.\n
    Good luck!\n\n\n\nEnter (p)lay to get started. \n\n"
  end

  def self.mastermind
    clear_screen
    puts "


███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗██████╗
████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗
██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║██║  ██║
██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██║  ██║
██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝




"

  end

   def self.clear_screen
     print "\e[2J\e[f"
   end

  def self.invalid_input(input)
    puts "#{input} is not a valid input. Please try again."
  end

  def self.enter
    printf 'Enter command: '
  end

  def self.enter_guess
    printf 'Enter Guess: '
  end

  def self.lose
    puts 'Sorry, you lose...'
  end

  def self.winner
    puts 'Congrats, you win!'
  end

  def self.start
    mastermind
    puts "I have generated a beginner sequence with four elements made up of: (#{colorful('r')})ed, (#{colorful('g')})reen, (#{colorful('b')})lue, and (#{colorful('y')})ellow. Use (q)uit at any time to end the game."
  end

  def self.round_result(results, turn_count)
    puts "'#{results[:guess]}' has #{results[:elements]} of the correct elements with #{results[:positions]} in the correct positions.\nYou've taken #{turn_count} guesses"
  end

  def self.quit
    puts "Quitting..."
  end

end
