require 'rainbow'  # => true

module Display
  def self.colorful(sequence)
    sequence.split("").map do |letter|        # => ["r", "g", "b", "y"]
      case letter                             # => "r", "g", "b", "y"
        when 'r' then Rainbow(letter).red     # => "r"
        when 'g' then Rainbow(letter).green   # => "g"
        when 'b' then Rainbow(letter).blue    # => "b"
        when 'y' then Rainbow(letter).yellow  # => "y"
        when 'w' then Rainbow(letter).white
        when 'b' then Rainbow(letter).black
        else letter
      end                                     # => "r", "g", "b", "y"
    end.join("")                              # => "rgby"
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

  def self.round_result(results, turn_count, guess)
    puts "'#{guess}' has #{results[:elements]} of the correct elements with #{results[:positions]} in the correct positions.\nYou've taken #{turn_count} guesses"
  end

  def self.quit
    puts "Quitting..."
  end

end

Display.colorful("rgby")  # => "rgby"
