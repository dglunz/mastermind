require 'rainbow'

module Display
  def self.colorful(color)
    case color
    when 'r' then Rainbow(color).red
    when 'g' then Rainbow(color).green
    when 'b' then Rainbow(color).blue
    when 'y' then Rainbow(color).yellow
    else color
    end
  end
  def self.introduction
    printf "Welcome\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n"
  end

  def self.enter
    printf 'Enter command: '
  end

  def self.enter_guess
    printf 'Enter Guess: '
  end

  def self.results
    puts 'Player Won/Lost'
  end

  def self.start
    puts "I have generated a beginner sequence with four elements made up of: (#{colorful('r')})ed, (#{colorful('g')})reen, (#{colorful('b')})lue, and (#{colorful('y')})ellow. Use (q)uit at any time to end the game."
  end

  def self.round_result(guess, elements, positions, count)
    puts "'#{guess}' has #{elements} of the correct elements with #{positions} in the correct positions.\nYou've taken #{count}"
  end

  def self.quit
    puts "Quitting..."
  end

end
